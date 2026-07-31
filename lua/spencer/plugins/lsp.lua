return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim", -- Mason for easy LS installs
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- Shared keymaps & settings when an LSP attaches to a buffer
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            -- Navigation (Integrated with your existing fzf-lua setup)
            vim.keymap.set("n", "gd", function() require("fzf-lua").lsp_definitions() end, opts)
            vim.keymap.set("n", "gr", function() require("fzf-lua").lsp_references() end, opts)
            vim.keymap.set("n", "gi", function() require("fzf-lua").lsp_implementations() end, opts)

            -- Buffer-local LSP Actions
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            
            -- Diagnostics
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            -- Automatically install these servers if they are missing
            ensure_installed = { "clangd", "pyright", "bashls" },

            -- Custom configs per LS
            handlers = {
                -- Default handler for LS (e.g., bashls here)
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                    })
                end,

                -- C/C++ LS (thread throttled)
                ["clangd"] = function()
                    lspconfig.clangd.setup({
                        on_attach = on_attach,
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--header-insertion=iwyu",
                            "-j=2",
                        },
                    })
                end,

                -- Python LS (open files only)
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        on_attach = on_attach,
                        settings = {
                            python = {
                                analysis = {
                                    autoSearchPaths = true,
                                    useLibraryCodeForTypes = true,
                                    diagnosticMode = "openFilesOnly",
                                },
                            },
                        },
                    })
                end,
            },
        })
    end,
}

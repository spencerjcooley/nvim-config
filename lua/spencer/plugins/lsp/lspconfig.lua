return { 
    "neovim/nvim-lspconfig",
    config = function()
        -- Add this line to get the capabilities from cmp-nvim-lsp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Shared keymaps when an LSP attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf, remap = false }

                -- Navigation
                vim.keymap.set("n", "gd", function() require("fzf-lua").lsp_definitions() end, opts)
                vim.keymap.set("n", "gr", function() require("fzf-lua").lsp_references() end, opts)
                vim.keymap.set("n", "gi", function() require("fzf-lua").lsp_implementations() end, opts)

                -- LSP actions
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                -- Diagnostics
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            end,
        })

        -- clangd (C/C++)
        vim.lsp.config("clangd", {
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",
                "--header-insertion=iwyu",
                "-j=2",
            },
            filetypes = {
                "c",
                "cpp",
                "objc",
                "objcpp",
                "cuda",
            },
        })

        -- pyright (Python)
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "openFilesOnly",
                    },
                },
                pyright = { disableTaggedHints = true, },
            },
        })

        -- vtsls (Typescript)
        vim.lsp.config("vtsls", {
            capabilities = capabilities,
            settings = {
                typescript = {
                    inlayHints = {
                        parameterNames = { enabled = "literals" },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    }
                },
            }
        })
    end,
}

return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            local is_eagle = vim.fn.hostname() == "eagle"

            local adapter = is_eagle and {
                name = "ollama",
                model = "qwen2.5-coder:7b",
            } or {
                name = "gemini",
                model = "gemini-2.5-flash-lite",
            }

            return {
                interactions = {
                    chat = {
                        adapter = adapter,
                        enabled = function()
                            if is_eagle then
                                return true
                            end

                            local api_key = vim.env.GEMINI_API_KEY
                            if api_key and api_key:match("%S") then
                                return true
                            end

                            vim.notify(
                                "CodeCompanion: GEMINI_API_KEY is not set or is empty.",
                                vim.log.levels.ERROR
                            )
                            return false
                        end,
                    },
                    inline = {
                        adapter = adapter,
                        enabled = function()
                            if is_eagle then
                                return true
                            end

                            local api_key = vim.env.GEMINI_API_KEY
                            if api_key and api_key:match("%S") then
                                return true
                            end

                            vim.notify(
                                "CodeCompanion: GEMINI_API_KEY is not set or is empty.",
                                vim.log.levels.ERROR
                            )
                            return false
                        end,
                    },
                },
            }
        end,
        keys = {
            {
                "<leader>ac",
                "<cmd>CodeCompanionChat<cr>",
                mode = { "n", "v" },
                desc = "AI chat",
            },
            {
                "<leader>ai",
                "<cmd>CodeCompanion<cr>",
                mode = { "n", "v" },
                desc = "AI inline prompt",
            },
            {
                "<leader>aa",
                "<cmd>CodeCompanionActions<cr>",
                mode = { "n", "v" },
                desc = "AI actions",
            },
        },
    },
}

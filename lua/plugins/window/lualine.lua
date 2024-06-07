return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "VimEnter" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            {
                "linrongbin16/lsp-progress.nvim",
                opts = {
                    {
                        decay = 1200,
                        series_format = function(title, message, percentage, done)
                            local builder = {}
                            local has_title = false
                            local has_message = false
                            if type(title) == "string" and string.len(title) > 0 then
                                table.insert(builder, title)
                                has_title = true
                            end
                            if type(message) == "string" and string.len(message) > 0 then
                                table.insert(builder, message)
                                has_message = true
                            end
                            if percentage and (has_title or has_message) then
                                table.insert(builder, string.format("(%.0f%%)", percentage))
                            end
                            return { msg = table.concat(builder, " "), done = done }
                        end,
                        client_format = function(client_name, spinner, series_messages)
                            if #series_messages == 0 then
                                return nil
                            end
                            local builder = {}
                            local done = true
                            for _, series in ipairs(series_messages) do
                                if not series.done then
                                    done = false
                                end
                                table.insert(builder, series.msg)
                            end
                            if done then
                                spinner = "✓" -- replace your check mark
                            end
                            return "["
                                .. client_name
                                .. "] "
                                .. spinner
                                .. " "
                                .. table.concat(builder, ", ")
                        end,
                    }
                },
            },
        },
        config = function(_, opts)
            require("lualine").setup(opts)

            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = "lualine_augroup",
                pattern = "LspProgressStatusUpdated",
                callback = require("lualine").refresh,
            })
        end,
        opts = {
            options = {
                component_separators = { left = "|", right = "|" },
                globalstatus = true,
            },
            sections = {
                -- lualine_a = {
                --     {
                --         "mode",
                --         fmt = function(str)
                --             return str:sub(1, 1)
                --         end,
                --     },
                -- },
                -- lualine_b = {
                --     { "branch", icons_enabled = false },
                -- },
                lualine_c = {
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
            },
        },
    },
}

return {
    { -- Theme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                transparent = true,
                on_colors = function(colors)
                    colors.fg_gutter = "#b2b8cf"
                end
            })
            vim.cmd [[colorscheme tokyonight]]
        end,
    },
}

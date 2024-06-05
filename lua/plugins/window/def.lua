return {
    { -- Nav
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = 'tokyonight' } }
    },
    {     -- Windows Switch
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        }
    },
    { -- Toggle Term
        'akinsho/toggleterm.nvim',
        lazy = false,
        opts = {
            open_mapping = [[<c-t>]],
            hide_numbers = true,
            direction = 'float'
        },
        keys = {
            -- { '<leader>j', [[<c-\><c-n>]] }
        }
    },
}

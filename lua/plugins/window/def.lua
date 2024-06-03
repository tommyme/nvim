return {
    { -- Nav
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = 'tokyonight' } }
    },
    { -- Tree
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = { { '<leader>e', "<cmd>Neotree toggle<CR>", desc = 'Toggle Neotree' } },
        opts = {
            close_if_last_window = true,
            window = {
                position = 'left'
            }
        }
    },
    { -- Windows Switch
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
    {     -- Top Buffer
        'akinsho/bufferline.nvim',
        version = "*",
        lazy = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                offsets = { {
                    filetype = 'neo-tree',
                    text = 'File Explorer',
                    hightlight = 'Directory',
                    text_align = 'left',
                } }
            }
        },
        keys = {
            { 'L',          '<cmd>bnext<CR>',     desc = 'Buffer Next' },
            { 'H',          '<cmd>bprevious<CR>', desc = 'Buffer Prev' },
            { '<leader>bq', '<cmd>bdelete<cr>',   desc = 'Buffer Close' }
        }
    },
    {     -- Toggle Term
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

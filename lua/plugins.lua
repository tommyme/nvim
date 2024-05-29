local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
        },
    },
    { -- Highlight
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "rust", "markdown" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    { -- Autopair
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    { -- Top Buffer
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
            { 'L', '<cmd>bnext<CR>',     desc = 'Buffer Next' },
            { 'H', '<cmd>bprevious<CR>', desc = 'Buffer Prev' }
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
    { -- Key finder
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { -- Scroll
        'karb94/neoscroll.nvim',
        config = true
    },
    {
        'willothy/moveline.nvim',
        build = 'make'
    },
    { -- VSCode Styled winbar
        'utilyre/barbecue.nvim',
        dependencies = { 'SmiteshP/nvim-navic' },
        config = true
    },
    -- {
    --     "iamcco/markdown-preview.nvim",
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = "cd app && yarn install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --     end,
    --     ft = { "markdown" },
    -- },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    { 'numToStr/Comment.nvim',   lazy = false, config = true },

    -- LSP Server
    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', desc = 'Format Code' },
            { '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>',            desc = 'Show Definition' },
            { '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',                 desc = 'hover' },
            { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',           desc = 'Code Action' }
        }
    },
    { 'williamboman/mason.nvim', config = true },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'nil_ls' }
            })
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {}
                end,
                ['nil_ls'] = function()
                    require('lspconfig').nil_ls.setup {
                        settings = {
                            ['nil'] = {
                                formatting = { command = { 'nixpkgs-fmt' } }
                            },
                        }
                    }
                end
            }
        end,
    },
})

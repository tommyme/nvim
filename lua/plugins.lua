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
    {   -- Theme
        "folke/tokyonight.nvim", lazy = false, priority = 1000,
        config = function ()
            require('tokyonight').setup({
                transparent = true,
            })
            vim.cmd[[colorscheme tokyonight]]
        end,
    },
    {   -- Nav
        "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = 'tokyonight' } }
    },
    {   -- Tree
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = { {'<leader>e', "<cmd>Neotree toggle<CR>", desc = 'Toggle Neotree'} },
        config = true,
    },
    {   -- Windows Switch
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<leader>wh", "<cmd>TmuxNavigateLeft<cr>" },
        { "<leader>wj", "<cmd>TmuxNavigateDown<cr>" },
        { "<leader>wk", "<cmd>TmuxNavigateUp<cr>" },
        { "<leader>wl", "<cmd>TmuxNavigateRight<cr>" },
        { "<leader>w\\", "<cmd>TmuxNavigatePrevious<cr>" },
      },
    },
    {   -- Highlight
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "rust", "markdown" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
    },
    {   -- Autopair
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
    {   -- Top Buffer 
        'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                offsets = {{
                    filetype = 'neo-tree',
                    text = 'File Explorer',
                    hightlight = 'Directory',
                    text_align = 'left',
                }}
            }
        },
        keys = {
            { 'L', '<cmd>bnext<CR>', desc = 'Buffer Next' },
            { 'H', '<cmd>bprevious<CR>', desc = 'Buffer Prev' }
        }
    },
    {   -- Toggle Term
        'akinsho/toggleterm.nvim',
        opts = {
            open_mapping = [[<leader>j]],
            hide_numbers = true,
            direction = 'float'
        },
        keys = {
            { '<leader>j', [[<c-\><c-n>]] }
        }
    },
    {   -- Key finder
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function ()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {   -- Scroll
        'karb94/neoscroll.nvim',
        config = true
    },
    {   -- VSCode Styled winbar
        'utilyre/barbecue.nvim',
        dependencies = { 'SmiteshP/nvim-navic' },
        config = true
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    }
})



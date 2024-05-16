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
        keys = { {'<C-b>', "<cmd>Neotree toggle<CR>", desc = 'Toggle Neotree'} },
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
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
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
            { 'L', '<cmd>bnext<CR>' },
            { 'H', '<cmd>bprevious<CR>'}
        }
    },
    {   -- Toggle Term
        'akinsho/toggleterm.nvim', config = true,
    }
})



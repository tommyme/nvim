return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true, -- 始终显示 Tab
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- disable the keymap to grep files
      -- change a keymap
      -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },
}

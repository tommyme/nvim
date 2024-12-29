-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- navigate back
map("n", "<A-Left>", "<C-o>", { desc = "Navigate back" })
map("n", "<A-Right>", "<C-i>", { desc = "Navigate forward" })

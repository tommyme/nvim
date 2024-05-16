vim.g.mapleader = " "

local keymap = vim.keymap

-- -- insert
keymap.set("i", "jk", "<ESC>")

-- -- visual
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>+2<CR>gv=gv")

-- -- normal
-- windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>qq", ":q!<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")

-- cancel highlight
-- keymap.set("n", "<leader>nh", ":nohl<CR>")


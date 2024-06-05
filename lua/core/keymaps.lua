vim.g.mapleader = " "

local keymap = vim.keymap

-- -- insert
keymap.set("i", "jk", "<ESC>")

-- -- visual
keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
keymap.set("v", "K", "<cmd>m '>+2<CR>gv=gv")

-- -- normal
-- windows
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>qq", "<cmd>q!<CR>")
keymap.set("n", "<leader>w", "<cmd>w<CR>")
keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rrors' })
keymap.set("n", "<leader>lq", vim.diagnostic.open_float, { desc = 'Show diagnostic [Q]uickfix' })


-- cancel highlight
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

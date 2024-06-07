vim.g.mapleader = " "

local keymap = vim.keymap

local format_and_save = function()
    local params = vim.lsp.util.make_formatting_params({})
    local bufnr = vim.api.nvim_get_current_buf()
    local client = vim.lsp.get_active_clients()[1]
    local handler = function(err, result)
        if not result then return end

        vim.lsp.util.apply_text_edits(result, bufnr, client.offset_encoding)
        vim.cmd('write')
    end

    client.request('textDocument/formatting', params, handler, bufnr)
end

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
keymap.set("n", "<leader>wq", function()
    format_and_save()
    vim.cmd('q')
end)
keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rrors' })
keymap.set("n", "<leader>lq", vim.diagnostic.open_float, { desc = 'Show diagnostic [Q]uickfix' })
keymap.set("n", "<leader>w", format_and_save)

-- cancel highlight
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

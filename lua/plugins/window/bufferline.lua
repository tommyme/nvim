return {
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
            { 'H', '<cmd>bprevious<CR>', desc = 'Buffer Prev' },
            {
                '<leader>bq',
                function()
                    if vim.bo.modified then
                        vim.cmd.write()
                    end
                    local buf = vim.fn.bufnr()
                    require('bufferline').cycle(-1)
                    vim.cmd.bdelete(buf)
                end,
                desc = 'Buffer Close'
            }
        }
    },
}

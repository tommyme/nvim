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
                    text = 'Explorer',
                    hightlight = 'Directory',
                    text_align = 'left',
                } }
            }
        },
        keys = {
            { 'L', '<cmd>bnext<CR>',     desc = 'Buffer Next' },
            { 'H', '<cmd>bprevious<CR>', desc = 'Buffer Prev' },
            {
                '<leader>c',
                function()
                    if vim.bo.modified then
                        vim.cmd.write()
                    end
                    local buf = vim.fn.bufnr()
                    require('bufferline').cycle(-1)
                    vim.cmd.bdelete(buf)
                end,
                desc = 'Buffer Close'
            },

            -- Bufferline Goto
            { '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', desc = 'Buffer Goto 1' },
            { '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', desc = 'Buffer Goto 2' },
            { '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', desc = 'Buffer Goto 3' },
            { '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', desc = 'Buffer Goto 4' },
            { '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', desc = 'Buffer Goto 5' },
            { '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', desc = 'Buffer Goto 6' },
            { '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', desc = 'Buffer Goto 7' },
            { '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', desc = 'Buffer Goto 8' },
            { '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', desc = 'Buffer Goto 9' },
        }
    },
}

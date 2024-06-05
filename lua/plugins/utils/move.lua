return {
    {
        'fedepujol/move.nvim',
        lazy = false,
        config = true,
        keys = {
            { 'n', '<M-j>', '<cmd>MoveLine(1)<cr>' },
            { 'n', '<M-k>', '<cmd>MoveLine(-1)<cr>' },
            { 'n', '<M-h>', '<cmd>MoveHChar(-1)<cr>' },
            { 'n', '<M-l>', '<cmd>MoveHChar(1)<cr>' },

            { 'v', '<M-j>', '<cmd>MoveBlock(1)<cr>' },
            { 'v', '<M-k>', '<cmd>MoveBlock(-1)<cr>' },
            { 'v', '<M-h>', '<cmd>MoveHBlock(-1)<cr>' },
            { 'v', '<M-l>', '<cmd>MoveHBlock(1)<cr>' },
        }
    },
}

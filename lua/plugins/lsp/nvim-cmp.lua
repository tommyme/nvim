local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end


return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup {
                preselect = cmp.PreselectMode.Item,
                window = {
                    documentation = cmp.config.window.bordered(),
                    completion = cmp.config.window.bordered({
                        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
                    }),
                },
                completion = {
                    completeopt = 'menu,menuone,select',
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources(
                    {
                        { name = 'crates' },
                        { name = 'copilot' },
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }
                    },
                    {
                        { name = 'buffer' },
                        { name = 'path' }
                    }
                ),
                formatting = {
                    format = require('lspkind').cmp_format({
                        -- with_text = true, -- do not show text alongside icons
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        mode = 'symbol',
                        symbol_map = {
                            Copilot = '',
                        },
                    })
                },
                mapping = {
                    -- 上一个
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    -- 下一个
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    -- 出现补全
                    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    -- 取消
                    ['<A-,>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- 确认
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({
                        select = true,
                        behavior = cmp.ConfirmBehavior.Replace
                    }),
                    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ["<Tab>"] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),
                }
            }
        end
    },

    -- Core
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- UI Bridge
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Snippets
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim'
}

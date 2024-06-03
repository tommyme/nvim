return {
    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', desc = 'Format Code' },
            { '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>',            desc = 'Show Definition' },
            { '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',                 desc = 'hover' },
            { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',           desc = 'Code Action' }
        }
    },
    { 'williamboman/mason.nvim', config = true },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'nil_ls' }
            })
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {}
                end,
                ['nil_ls'] = function()
                    require('lspconfig').nil_ls.setup {
                        settings = {
                            ['nil'] = {
                                formatting = { command = { 'nixpkgs-fmt' } }
                            },
                        }
                    }
                end
            }
        end,
    },
}

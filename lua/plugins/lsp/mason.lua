local servers = {
    clangd = {},
    lua_ls = {
        Lua = {
            hint = { enable = true }
        }
    },
    rust_analyzer = {},
}

if vim.loop.os_uname().sysname == 'Linux' then
    servers.nil_ls = {
        settings = {
            ['nil'] = {
                formatting = { command = { 'nixpkgs-fmt' } }
            },
        }
    }
end

local ensure_installed_names = vim.tbl_keys(servers or {})
return {
    {
        'neovim/nvim-lspconfig',
        keys = {
            { '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>',                            desc = 'Format Code' },
            { '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>',                                       desc = 'Show Definition' },
            { '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',                                            desc = 'hover' },
            { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',                                      desc = 'Code Action' },
            { '<leader>li', '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>', desc = 'Toggle inlay hint' }
        },
    },
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed == ensure_installed_names
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    local server = servers[server_name] or {}
                    require('lspconfig')[server_name].setup(server)
                end,
            }
        end,
    },
}
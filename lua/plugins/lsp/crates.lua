return {
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = true,
        keys = {
            { '<leader>ct', '<cmd>Crates toggle<cr>',                             desc = 'Crates toggle' },
            { '<leader>cr', '<cmd>Crates reload<cr>',                             desc = 'Crates reload' },
            { '<leader>cv', '<cmd>Crates show_versions_popup<cr>',                desc = 'Crates show versions popup' },
            { '<leader>cf', '<cmd>Crates show_features_popup<cr>',                desc = 'Crates show features popup' },
            { '<leader>cd', '<cmd>Crates show_dependencies_popup<cr>',            desc = 'Crates show dependencies popup' },
            { '<leader>cu', '<cmd>Crates update_crate<cr>',                       desc = 'Crates update crate' },
            { '<leader>cU', '<cmd>Crates upgrade_crate<cr>',                      desc = 'Crates upgrade crate' },
            { '<leader>ca', '<cmd>Crates update_all_crates<cr>',                  desc = 'Crates update all crates' },
            { '<leader>cA', '<cmd>Crates upgrade_all_crates<cr>',                 desc = 'Crates upgrade all crates' },
            { '<leader>cx', '<cmd>Crates expand_plain_crate_to_inline_table<cr>', desc = 'Crates expand plain crate to inline table' },
            { '<leader>cX', '<cmd>Crates extract_crate_into_table<cr>',           desc = 'Crates extract crate into table' },
            { '<leader>cH', '<cmd>Crates open_homepage<cr>',                      desc = 'Crates open homepage' },
            { '<leader>cR', '<cmd>Crates open_repository<cr>',                    desc = 'Crates open repository' },
            { '<leader>cD', '<cmd>Crates open_documentation<cr>',                 desc = 'Crates open documentation' },
            { '<leader>cC', '<cmd>Crates open_crates_io<cr>',                     desc = 'Crates open crates io' },
        }
    }
}

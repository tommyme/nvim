local opt = vim.opt

-- Macos
if vim.g.neovide then
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    vim.g.neovide_window_blurred = false
    -- vim.g.neovide_transparency = 0.7
end

-- line number
opt.relativenumber = true
opt.number = true

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- unwrap
opt.wrap = false

-- mouse
opt.mouse:append("a")

-- clipboard
opt.clipboard:append("unnamedplus")

-- windows
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- outlook
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 10

-- misc
opt.breakindent = true
opt.undofile = true

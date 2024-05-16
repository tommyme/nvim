local opt = vim.opt

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
-- opt.clipboard:append("unnamedplus")

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

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.guicursor = {
  "n-v-c:block-Cursor/lCursor",      -- 普通模式、可视模式和命令模式为块状光标
  "i:block-CursorInsert/lCursor",   -- 插入模式为竖线光标
  "r:block-CursorReplace/lCursor",  -- 替换模式为横线光标
}
vim.g.lazyvim_picker = "fzf"
-- 设置光标颜色
vim.cmd([[
  highlight Cursor guifg=NONE guibg=white
  highlight CursorInsert guifg=NONE guibg=green
  highlight CursorReplace guifg=NONE guibg=red
]])

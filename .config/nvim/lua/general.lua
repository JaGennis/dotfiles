vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remove trailing white space when saving
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
]])

vim.g.mapleader = ' '
vim.keymap.set('n', 'J', ':tabp<CR>')
vim.keymap.set('n', 'K', ':tabn<CR>')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<Leader>rr', ':luafile %<CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '=', ':vertical resize +5<CR>')
vim.keymap.set('n', '-', ':vertical resize -5<CR>')
vim.keymap.set('n', '+', ':horizontal resize +5<CR>')
vim.keymap.set('n', '_', ':horizontal resize -5<CR>')
vim.keymap.set('c', 'w!!', "silent! write ! doas tee % > /dev/null", { silent = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

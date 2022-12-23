vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true

vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.filetype = true

-- Remove white space when saving
vim.cmd([[
    autocmd BufWritePre * %s/\s\+$//e
]])

-- Hm?
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', 'J', ':tabp<CR>')
vim.keymap.set('n', 'K', ':tabn<CR>')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<Leader>rr', ':luafile %<CR>')
vim.keymap.set('n', 'n', 'nzz')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup({
    open_on_setup = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "J", action = "" },
                { key = "K", action = "" },
                { key = "T", action = "tabnew" },
            },
        },
    }
})

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')

local original_onedark = require('lualine.themes.onedark')
local custom_onedark = require('lualine.themes.onedark')
custom_onedark.insert.a, custom_onedark.normal.a =
    original_onedark.normal.a, original_onedark.insert.a

require('lualine').setup({
    options = { theme = custom_onedark }
})

require('Comment').setup({
    toggler = {
        line = '<c-space>'
    },
    opleader = {
        line = '<c-space>'
    }
})

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', gs.next_hunk)
    map('n', '[h', gs.prev_hunk)
    --   if vim.wo.diff then return ']c' end
    --   vim.schedule(function() gs.next_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})

    -- map('n', '[h', function()
    --   if vim.wo.diff then return '[c' end
    --   vim.schedule(function() gs.prev_hunk() end)
    --   return '<Ignore>'
    -- end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

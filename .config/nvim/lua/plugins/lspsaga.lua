local plugin = {
    'glepnir/lspsaga.nvim',
    requires = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter"
    },
    branch = "main",
    config = function()
        require('lspsaga').setup({
            code_action = {
                keys = {
                    exec = '<CR>',
                    quit = '<ESC>',
                }
            },
            show_outline = {
                jump_key = '<CR>'
            }
        })
        vim.keymap.set('n', '<leader>lf', "<cmd>Lspsaga lsp_finder<CR>", {})
        vim.keymap.set('n', '<leader><leader>', "<cmd>Lspsaga code_action<CR>", {})
        vim.keymap.set('n', '<leader>k', "<cmd>Lspsaga hover_doc<CR>", {})
        vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
        vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
        vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_cursor_diagnostics<CR>", {})
        vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", {})

        -- vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", {})
        vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", {})

        -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()]]
    end
}

return plugin

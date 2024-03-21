local plugin = {
    'glepnir/lspsaga.nvim',
    requires = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter"
    },
    branch = "main",
    keys = {
        {"<leader>lf", "<cmd>Lspsaga lsp_finder<cr>"},
        {"<leader><leader>", "<cmd>Lspsaga code_action<CR>"},
        {"<leader>k", "<cmd>Lspsaga hover_doc<CR>"},
        {"]d", "<cmd>Lspsaga diagnostic_jump_next<CR>"},
        {"[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>"},
        {"<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>"},
        {"<leader>rn", "<cmd>Lspsaga rename<CR>"},
        {"<leader>pd", "<cmd>Lspsaga peek_definition<CR>"},
        {"<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>"},
        {"<leader>o", "<cmd>Lspsaga outline<CR>"},
    },
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false,
            },
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

        -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()]]
    end
}

return plugin

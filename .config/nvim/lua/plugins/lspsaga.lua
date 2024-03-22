local plugin = {
    'glepnir/lspsaga.nvim',
    requires = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter"
    },
    event = "LspAttach",
    branch = "main",
    keys = {
        {"<leader>lf", "<cmd>Lspsaga finder<cr>", desc = "Open LSP Finder"},
        {"<leader><leader>", "<cmd>Lspsaga code_action<CR>", desc = "Show Code Actions"},
        {"<leader>k", "<cmd>Lspsaga hover_doc<CR>", desc = "Show documentation"},
        {"]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic"},
        {"[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to previous diagnostic"},
        {"<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show diagnostic under cursor"},
        {"<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "Rename symbol under cursor"},
        {"<leader>pd", "<cmd>Lspsaga peek_definition<CR>", desc = "Show definition"},
        {"<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Show type definition"},
        {"<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Show outline"},
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

local plugin = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>"},
        {"<leader>lg", "<cmd>Telescope live_grep<cr>"},
        {"<leader>ts", "<cmd>Telescope treesitter<cr>"},
        {"<leader>gr", "<cmd>Telescope lsp_references<cr>"},
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    }
                }
            },
        })
    end
}

return plugin

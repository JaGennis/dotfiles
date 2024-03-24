return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files"},
        {"<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
        {"<leader>ts", "<cmd>Telescope treesitter<cr>", desc = "Open Treesitter"},
        {"<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Open LSP references"},
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

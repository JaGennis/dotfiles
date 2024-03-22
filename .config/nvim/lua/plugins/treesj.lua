local plugin = {
    'Wansmer/treesj',
    keys = {
        {"<leader>sj", "<cmd>TSJToggle<cr>"},
        {"<leader>jo", "<cmd>TSJJoin<cr>"},
        {"<leader>sp", "<cmd>TSJSplit<cr>"},
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
}

return plugin

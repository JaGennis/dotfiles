return {
    'Wansmer/treesj',
    keys = {
        {"<leader>tt", "<cmd>TSJToggle<cr>", desc = "Split or join node under cursor"},
        {"<leader>jj", "<cmd>TSJJoin<cr>", desc = "Join node under cursor"},
        {"<leader>ss", "<cmd>TSJSplit<cr>", desc = "Split node under cursor"},
    },
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup()
    end,
}

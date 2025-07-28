return {
    'Wansmer/treesj',
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        {"J", "<cmd>TSJToggle<cr>", desc = "Split or join node under cursor"},
        -- {"<leader>tj", "<cmd>TSJJoin<cr>", desc = "Join node under cursor"},
        -- {"<leader>ts", "<cmd>TSJSplit<cr>", desc = "Split node under cursor"},
    },
    event = "VeryLazy",
    config = function()
      require("treesj").setup({
          use_default_keymaps = false,
      })
    end,
}

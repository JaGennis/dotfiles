return {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
        require('leap').setup({})
        require('leap').create_default_mappings()
    end,
}

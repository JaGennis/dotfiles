return {
    -- {
    --     'navarasu/onedark.nvim',
    --     config = function()
    --         require('onedark').setup({
    --             transparent = true,
    --         })
    --         require('onedark').load()
    --     end
    -- },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedarkpro").setup({
                options = {
                    transparency = true,
                }
            })
            vim.cmd("colorscheme onedark")
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    }
}

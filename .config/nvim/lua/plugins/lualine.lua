return {
    'nvim-lualine/lualine.nvim',
    dependenices = { "nvim-tree/nvim-web-devicons"},
    config = function()
        local original_onedark = require('lualine.themes.onedark')
        local custom_onedark = require('lualine.themes.onedark')
        custom_onedark.insert.a, custom_onedark.normal.a =
            original_onedark.normal.a, original_onedark.insert.a
        require('lualine').setup {
            options = { theme = custom_onedark }
        }
    end
}

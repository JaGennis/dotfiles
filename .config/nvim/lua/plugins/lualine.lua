local plugin = {
    'nvim-lualine/lualine.nvim',
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

return plugin

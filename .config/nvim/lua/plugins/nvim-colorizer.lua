local plugin = {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup()
    end
}

return plugin

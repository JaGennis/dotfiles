local plugin = {
    'folke/neodev.nvim',
    config = function()
        require('neodev').setup({})
    end,
}

return plugin

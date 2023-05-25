local plugin = {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end
}

return plugin

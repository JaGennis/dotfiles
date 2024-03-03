local plugin = {
    'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup({
            transparent = true,
        })
        require('onedark').load()
    end
}

return plugin

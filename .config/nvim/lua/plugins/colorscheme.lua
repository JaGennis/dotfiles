local plugin = {
    'navarasu/onedark.nvim',
    setup = function()
        vim.opt.termguicolors = true
    end,
    config = function()
        require('onedark').setup({
            transparent = true,
        })
        require('onedark').load()
    end
}

return plugin

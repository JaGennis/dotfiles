local plugin = {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
    config = function()
        vim.opt.termguicolors = true
        vim.opt.list = true
        vim.opt.listchars:append "space:⋅"
        require('ibl').setup {}
    end
}

return plugin

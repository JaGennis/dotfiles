local plugin = {
    'ray-x/lsp_signature.nvim',
    config = function()
        require("lsp_signature").setup()
    end
}

return plugin

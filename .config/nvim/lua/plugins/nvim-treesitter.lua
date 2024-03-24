return {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "markdown", "markdown_inline", "vim" },
            highlight = { enable = true, disable = { "gitcommit" }, },
            sync_install = true,
            auto_install = true,
        }
    end
}

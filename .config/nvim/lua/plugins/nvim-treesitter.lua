return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context',
        'chrisgrieser/nvim-various-textobjs'
    },
    run = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    keys = {
        {"as", mode = {'o', 'x'}, function() require("various-textobjs").subword("outer") end, desc = "Outer subword"},
        {"is", mode = {'o', 'x'}, function() require("various-textobjs").subword("inner") end, desc = "Inner subword"},
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "markdown", "markdown_inline", "vim" },
            highlight = { enable = true, disable = { "gitcommit" }, },
            sync_install = true,
            auto_install = true,
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, --???
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["agc"] = "@loop.outer",
                        ["igc"] = "@loop.inner",
                    }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>np"] = "@parameter.inner",
                        ["<leader>nf"] = "@function.outer",
                    },
                    swap_previous = {
                        ["<leader>pp"] = "@parameter.inner",
                        ["<leader>pf"] = "@function.outer",
                    }
                }
            }
        })
        require('treesitter-context').setup({
            enable = true,
        })
    end
}

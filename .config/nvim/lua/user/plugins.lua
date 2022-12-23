local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- use 'lewis6991/impatient.nvim'
    use {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup()
        end
    }
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                automatic_installation = true
            })
        end
    }

    -- autocompletion with nvim-cmp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
        }
    }

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require("lsp_signature").setup()
        end
    }
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            local options = {
                code_action_keys = {
                    exec = '<CR>',
                    quit = '<ESC>',
                },
                show_outline = {
                    jump_key = '<CR>'
                }
            }

            require('lspsaga').init_lsp_saga(options)
            vim.keymap.set('n', '<leader>lf', "<cmd>Lspsaga lsp_finder<CR>", {})
            vim.keymap.set('n', '<leader><leader>', "<cmd>Lspsaga code_action<CR>", {})
            vim.keymap.set('n', '<leader>k', "<cmd>Lspsaga hover_doc<CR>", {})
            vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
            vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
            vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_cursor_diagnostics<CR>", {})
            vim.keymap.set('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", {})

            -- vim.keymap.set("n", "<leader>pk", "<cmd>Lspsaga peek_definition<CR>", {})
            vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>",{})

            -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_cursor_diagnostics()]]
        end
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.eslint_d,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.formatting.prettier,
                },
            })
        end
    }


    use 'numToStr/Comment.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        -- config = function()
        --     require('gitsigns').setup()
        -- end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })()
        end,
        config = function()
            require('nvim-treesitter.configs').setup{
                highlight = {enable=true, disable = {"gitcommit"},},
                sync_install = true,
                auto_install = true,
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = { 'nvim-treesitter/treesitter'}
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use {
        'nvim-lualine/lualine.nvim',
        -- config = function()
        --     local original_onedark = require('lualine.themes.onedark')
        --     local custom_onedark = require('lualine.themes.onedark')
        --     custom_onedark.insert.a, custom_onedark.normal.a =
        --         original_onedark.normal.a, original_onedark.insert.a
        --     require('lualine').setup{
        --         options = { theme = custom_onedark }
        --     }
        -- end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use {
        'kylechui/nvim-surround',
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
            vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        }
                    }
                },
            })
        end
    }
    use {
        'stevearc/dressing.nvim'
    }
    use {
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

    if packer_bootstrap then
        require('packer').sync()
    end
end)

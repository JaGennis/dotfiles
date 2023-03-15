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
            require('neodev').setup({})
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason').setup()
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
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'calc' },
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(4),
                })
            })
        end
    }

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require("lsp_signature").setup()
        end
    }
    use {
        'glepnir/lspsaga.nvim',
        requires = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter"
        },
        branch = "main",
        config = function()
            require('lspsaga').setup({
                code_action = {
                    keys = {
                        exec = '<CR>',
                        quit = '<ESC>',
                    }
                },
                show_outline = {
                    jump_key = '<CR>'
                }
            })
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


    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = '<c-space>'
                },
                opleader = {
                    line = '<c-space>'
                }
            })
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                      opts = opts or {}
                      opts.buffer = bufnr
                      vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']h', gs.next_hunk)
                    map('n', '[h', gs.prev_hunk)

                    -- Actions
                    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hR', gs.reset_buffer)
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hD', function() gs.diffthis('~') end)
                    map('n', '<leader>td', gs.toggle_deleted)

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end
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
                -- auto_install = true,
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        -- requires = { 'nvim-treesitter/nvim-treesitter'}
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local function open_tab_silent(node)
                local api = require("nvim-tree.api")

                api.node.open.tab(node)
                vim.cmd.tabprev()
            end
            vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')
            require('nvim-tree').setup({
                -- open_on_setup = true,
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
                            { key = "J", action = "" },
                            { key = "K", action = "" },
                            { key = "T", action = "open_tab_silent", action_cb = open_tab_silent },
                        },
                    },
                }
            })
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            local original_onedark = require('lualine.themes.onedark')
            local custom_onedark = require('lualine.themes.onedark')
            custom_onedark.insert.a, custom_onedark.normal.a =
                original_onedark.normal.a, original_onedark.insert.a
            require('lualine').setup{
                options = { theme = custom_onedark }
            }
        end
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
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.opt.termguicolors = true
            -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
            -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
            -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
            -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
            -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
            -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

            vim.opt.list = true
            vim.opt.listchars:append "space:⋅"
            require("indent_blankline").setup{
                space_char_blankline = " ",
                show_current_context_start = true,
                char_highlight_list = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                    "IndentBlanklineIndent3",
                    "IndentBlanklineIndent4",
                    "IndentBlanklineIndent5",
                    "IndentBlanklineIndent6",
                },
            }
        end
    }

    use {
        'NoahTheDuke/vim-just',
    }

    -- use {
    --     'ShinKage/idris2-nvim',
    --     requires = {
    --         'neovim/nvim-lspconfig',
    --         'MunifTanjim/nui.nvim'
    --     },
    --     config = function()
    --         require('idris2').setup({})
    --     end
    -- }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

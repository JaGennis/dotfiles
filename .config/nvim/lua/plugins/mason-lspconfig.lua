local plugin = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- require('neodev').setup()
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup { capabilities = capabilities }
        lspconfig.tsserver.setup { capabilities = capabilities }
        lspconfig.eslint.setup { capabilities = capabilities }
        lspconfig.angularls.setup { capabilities = capabilities }
        lspconfig.jsonls.setup { capabilities = capabilities }
        lspconfig.yamlls.setup { capabilities = capabilities }
        lspconfig.html.setup { capabilities = capabilities }
        lspconfig.cssls.setup { capabilities = capabilities }
        lspconfig.rust_analyzer.setup { capabilities = capabilities }
        lspconfig.clangd.setup { capabilities = capabilities }
        lspconfig.qmlls.setup{ capabilities = capabilities }
        lspconfig.hls.setup{ capabilities = capabilities }
        require('mason').setup()
        require('mason-lspconfig').setup({
            automatic_installation = true
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)

        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

        vim.diagnostic.config({
            virtual_text = false
        })
    end
}

return plugin

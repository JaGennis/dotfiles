local plugin = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
    },
    lazy = false,
    keys = {
        {"<C-k>", vim.lsp.buf.signature_help },
        {"leader>f", function() vim.lsp.buf.format { async = true } end },
        {"<leader>q", vim.diagnostic.setloclist },
        {'gD', vim.lsp.buf.declaration },
        {'gd', vim.lsp.buf.definition },
        {'gi', vim.lsp.buf.implementation },
        {'gt', vim.lsp.buf.type_definition },
        {'gr', vim.lsp.buf.references },
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

        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

        vim.diagnostic.config({
            virtual_text = false
        })
    end
}

return plugin

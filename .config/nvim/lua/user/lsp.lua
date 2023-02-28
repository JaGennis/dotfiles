local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', '<space>k', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<space><space>', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)

-- local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- end
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('neodev').setup()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup { capabilities = capabilities }
lspconfig.omnisharp.setup {
    capabilities = capabilities,
    enable_roslyn_analyzers = true,
    root_dir = lspconfig.util.root_pattern('*.sln'),
    cmd = {"/Users/jannis.geuppert/.local/share/nvim/mason/bin/omnisharp"}
    -- enable_ms_build_load_projects_on_demand = true,
}
lspconfig.tsserver.setup { capabilities = capabilities }
lspconfig.angularls.setup { capabilities = capabilities }
lspconfig.jsonls.setup { capabilities = capabilities }
lspconfig.yamlls.setup { capabilities = capabilities }
lspconfig.html.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.rust_analyzer.setup { capabilities = capabilities }


vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.diagnostic.config({
    virtual_text = false
})

return {
  'neovim/nvim-lspconfig',
  dependencies = {
      'mason-org/mason-lspconfig.nvim',
      'mason-org/mason.nvim',
  },
  keys = {
      {"<leader>fo", function() vim.lsp.buf.format { async = true } end, desc = "Format buffer" },
      {"<leader>q", vim.diagnostic.setloclist, desc = "Show diagnostics" },
      {'gD', vim.lsp.buf.declaration, desc = "Go to declaration"},
      {'gd', vim.lsp.buf.definition, desc = "Go to definition" },
      {'gi', vim.lsp.buf.implementation, desc = "Go to implementation" },
      {'gt', vim.lsp.buf.type_definition, desc = "Go to type definition" },
      {'gr', vim.lsp.buf.references, desc = "Go to references" },
      { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)"},
  },
  lazy = false,
  opts = {
    servers = {
      lua_ls = {},
      clangd = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
    require('mason').setup()
    require('mason-lspconfig').setup({
        automatic_installation = true
    })
  end
}

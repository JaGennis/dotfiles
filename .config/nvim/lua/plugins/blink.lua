return {
  'saghen/blink.cmp',
  version = '1.*',
  -- build = 'cargo build --release',
  opts = {
    keymap = {
        preset = 'enter'
    },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
  },
    -- fuzzy = { implementation = "prefer_rust_with_warning" }
  opts_extend = { "sources.default" }
}

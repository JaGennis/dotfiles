return {
  'saghen/blink.cmp',
  version = '1.*',
  -- build = 'cargo build --release',
  opts = {
    keymap = {
        preset = 'enter'
    },
    -- fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

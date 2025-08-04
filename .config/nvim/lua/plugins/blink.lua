return {
    'saghen/blink.cmp',
    version = '1.*',
    -- build = 'cargo build --release',
    dependencies = "fang2hou/blink-copilot",
    opts = {
        cmdline = {
            keymap = {
                ["<CR>"] = { 'accept', 'fallback' }
            },
        },
        keymap = {
            preset = 'enter',
            ["<Tab>"] = {
                "select_next",
                "snippet_forward",
                "fallback",
            },

            ["<S-Tab>"] = {
                "select_prev",
                "snippet_backward",
                "fallback",
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                cmdline = {
                    min_keyword_length = function(ctx)
                        -- when typing a command, only show when the keyword is 3 characters or longer
                        if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
                        return 0
                    end
                },
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
    },
    -- fuzzy = { implementation = "prefer_rust_with_warning" }
    opts_extend = { "sources.default" }
}

return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        picker = {
            sources = {
                explorer = {
                    hidden = true,
                    win = { list = { keys = { ['<c-t>'] = 'tab' } } } },
                git_status = {
                    focus = "list",
                    win = { list = { keys = { ['<Tab>'] = { "git_stage", mode = { "n", "i" } } } } }
                },
                notifications = { focus = "list" },
            }
        },
        words = { enabled = true },
        notifier = { enabled = true },
    },
    keys = {
        { "<leader>e", function() Snacks.explorer({ hidden = true }) end, desc = "File Explorer"},
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History"},
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep"},
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History"},

        -- find
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files"},
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config")}) end, desc = "Find Config Files"},
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers"},

        -- search
        { "<leader>gw", function() Snacks.picker.grep_word() end, desc = "Grep Word", mode = { "n", "x" }},
        { "<leader>km", function() Snacks.picker.keymaps() end, desc = "Keymaps"},
        { "<leader>dd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics"},
        { "<leader>db", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics Buffer"},
        { "<leader>ic", function() Snacks.picker.icons() end, desc = "Icons"},
        { "<leader>uh", function() Snacks.picker.undo() end, desc = "Undo History"},
        { "<leader>la", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec"},

        -- git
        { "<leader>gd",  function() Snacks.picker.git_diff    ({ focus = 'list' }) end, desc = "Git Diff"},
        { "<leader>gst", function() Snacks.picker.git_status  ({ focus = 'list' }) end, desc = "Git Status"},
        { "<leader>gb",  function() Snacks.picker.git_branches({ focus = 'list' }) end, desc = "Git Branches"},
        { "<leader>glg", function() Snacks.picker.git_log     ({ focus = 'list' }) end, desc = "Git Log"},
        { "<leader>gll", function() Snacks.picker.git_log_line({ focus = 'list' }) end, desc = "Git Log Line"},
        { "<leader>glf", function() Snacks.picker.git_log_file({ focus = 'list' }) end, desc = "Git Log File"},

        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
        { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

        -- words
        { "]r", function() Snacks.words.jump(1, true) end, desc = "Jump to next reference" },
        { "[r", function() Snacks.words.jump(-1, true) end, desc = "Jump to next reference" },
    }
}

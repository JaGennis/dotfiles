return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    keys = {
        {"]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Jump to next hunk"},
        {"[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Jump to previous hunk"},
        {"<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk"},
        {"<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk"},
        {"<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk"},
        {"<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk"},
        {"<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer"},
        {"<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer"},
        {"<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame"},
        {"<leader>hb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line"},
        {"<leader>hd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff current buffer"},
        {"<leader>td", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle deleted"},
        {"ih", "<cmd>Gitsigns select_hunk<cr>", mode = {"o", "x"}, desc = "Select hunk"}
    },
    config = function()
        require('gitsigns').setup()
    end
}

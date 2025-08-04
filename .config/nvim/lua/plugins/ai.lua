return {
    {
        "github/copilot.vim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Copilot",
        event = "BufWinEnter",
        init = function()
            vim.g.copilot_no_maps = true
        end,
        config = function()
            -- Block the normal Copilot suggestions
            vim.api.nvim_create_augroup("github_copilot", { clear = true })
            vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
                group = "github_copilot",
                callback = function(args)
                    vim.fn["copilot#On" .. args.event]()
                end,
            })
            vim.fn["copilot#OnFileType"]()
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        build = "make tiktoken",
        opts = {
            mappings = {
                reset = {
                    normal = "<C-x>",
                    insert = "<C-x>",
                }
            },
            prompts = {
                RewriteFunctional = {
                    prompt =
                    "Rewrite this code in a functional programming style / Haskell like and use the newest c++ features if possible",
                    description = "Rewrite the selected code in a functional programming style",
                },
                Diagnostic = {
                    prompt = "#diagnostics:current",
                    description = "Fix current diagnostics",
                },
            },
        },
        keys = {
            { "<leader>cc", "<cmd>CopilotChatToggle<CR>",     desc = "Toggle copilot chat window", mode = { "n", "x" } },
            { "<leader>cr", "<cmd>CopilotChatReview<CR>",     desc = "Review selected code",       mode = { "n", "x" } },
            { "<leader>cg", "<cmd>CopilotChatCommit<CR>",     desc = "Generate commit message",    mode = { "n", "x" } },
            { "<leader>ce", "<cmd>CopilotChatExplain<CR>",    desc = "Explain selected code",      mode = { "n", "x" } },
            { "<leader>cf", "<cmd>CopilotChatFix<CR>",        desc = "Fix selected code",          mode = { "n", "x" } },
            { "<leader>co", "<cmd>CopilotChatOptimize<CR>",   desc = "Optimize selected code",     mode = { "n", "x" } },
            { "<leader>cd", "<cmd>CopilotChatDocs<CR>",       desc = "Document selected code",     mode = { "n", "x" } },
            { "<leader>cx", "<cmd>CopilotChatDiagnostic<CR>", desc = "Document selected code",     mode = { "n", "x" } },
        },
    },
}

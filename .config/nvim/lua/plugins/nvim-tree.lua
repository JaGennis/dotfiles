local plugin = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {"<leader>n", "<cmd>NvimTreeFindFileToggle<cr>"},
    },
    config = function()
        local function on_attach(bufnr)
            local api = require('nvim-tree.api')
            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.del('n', 'J', { buffer = bufnr })
            vim.keymap.del('n', 'K', { buffer = bufnr })
            vim.keymap.set('n', 'T', function()
                local node = api.tree.get_node_under_cursor()
                api.node.open.tab(node)
                vim.cmd.tabprev()
            end, opts('open_tab_silent'))
        end

        require('nvim-tree').setup({ on_attach = on_attach, view = { adaptive_size = true, centralize_selection = true } })
    end
}

return plugin

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {"<leader>hl", function()
            local conf = require("telescope.config").values
            local file_paths = {}
            for _, item in ipairs(require("harpoon"):list().items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end, desc = "Open harpoon list"},
        {"<leader>ha", function() require("harpoon"):list():append() end, desc = "Append to harpoon list"},
        {"<leader>hx", function() require("harpoon"):list():remove() end, desc = "Append to harpoon list"},
    },
    config = function()
        require("harpoon").setup()
    end
}

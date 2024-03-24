return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<c-space>'
            },
            opleader = {
                line = '<c-space>'
            }
        })
    end
}

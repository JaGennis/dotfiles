function dbg(arg)
    print(vim.inspect(arg))
    return arg
end

require('user.plugins')
-- require('impatient')
require('user.general')
require('user.lsp')


if vim.g.vscode then

else
    require('config.lspkind')
    require('config.doom-one')
    require('config.gitsigns')
    require('config.lualine')
    require('config.focus')

    require('config.nvim-cmp')
    require('config.fm-nvim')
    require('config.koka')
    require('config.treesitter')
    require('config.copilot')
    require('config.rainbow-delimiters')
    require('config.indent-blankline')
    require('config.markdown-preview')
    require('config.aerial')
    require('config.cursorline')
    require('config.colorizer')
    require('config.neoscroll')
end
require('config.which-key')
require('config.telescope')
require('config.possession')
require('config.momento')
require('config.conjure')


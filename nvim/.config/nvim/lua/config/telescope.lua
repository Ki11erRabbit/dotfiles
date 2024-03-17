require('telescope').setup {
    extensions = {
        file_browser = {},
    }
}

require('telescope').load_extension('file_browser')
--require('telescope').load_extension('possession')


local home = os.getenv('HOME')

local g = vim.g
local o = vim.o
local a = vim.api


a.nvim_set_keymap("n", "<space>fd", ":Telescope file_browser path=" .. home .. "/.config/nvim<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fw", ":Telescope live_grep<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>ff", ":Telescope find_files find_command=rg,--hidden,--files<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true })

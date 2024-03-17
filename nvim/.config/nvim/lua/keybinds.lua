local home = os.getenv('HOME')


local g = vim.g
local o = vim.o
local a = vim.api


--| Vim-visual-multi |--
vim.cmd [[
"let g:VM_default_mappings = 0
let g:VM_custom_motions = {'h': 'm', 'j':'n', 'k':'e', 'l':'i'}
"let g:VM_custom_remaps = {'h': 'm', 'j':'n', 'k':'e', 'l':'i'}
let g:VM_maps = {}
let g:VM_maps["Find Next"] = 'j'
let g:VM_maps["Find Prev"] = 'J'
let g:VM_maps["Find Under"] = '<C-c>'
let g:VM_maps["Add Cursor Down"] = '<M-n>'
let g:VM_maps["Add Cursor Up"] = '<M-e>'
let g:VM_maps["Select h"] = 'M'
let g:VM_maps["Select j"] = 'N'
let g:VM_maps["Select k"] = 'E'
let g:VM_maps["Select l"] = 'I'
let g:VM_maps['i'] = 'o'
let g:VM_maps['I'] = 'O'
"let g:VM_maps['y'] = 'y'
let g:VM_maps['m'] = 'k'
"let g:VM_maps['h'] = 'm'
"let g:VM_maps['j'] = 'n'
"let g:VM_maps['k'] = 'e'
"let g:VM_maps['l'] = 'i'
]]

--| Focus Spit |--
vim.api.nvim_set_keymap('n', '<leader>m', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', ':FocusSplitRight<CR>', { silent = true })
--| Renamer.nvim |--
a.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
a.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

--| Yanky |--
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

--| Number Toggle |--

a.nvim_set_keymap("n", "<space>N", ":setlocal invrelativenumber<cr>", { noremap = true })
--| Telescope Options |--
a.nvim_set_keymap("n", "<space>fd", ":Telescope file_browser path=" .. home .. "/.config/nvim<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fw", ":Telescope live_grep<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>ff", ":Telescope find_files find_command=rg,--hidden,--files<cr>", { noremap = true })
a.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true })

--| Nvim-gdb controls |--
a.nvim_set_keymap("n","<space>db", ":GdbBreakpointToggle<cr>", {noremap = true })
a.nvim_set_keymap("n","<space>dc", ":GdbContinue<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>dn", ":GdbNext<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>ds", ":GdbStep<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>dl", ":GdbLopenBreakboints<cr>", { noremap = true })

--| Memento Config |--
a.nvim_set_keymap("n","<space>fh", ":lua require('memento').toggle()<cr>", { noremap = true })


a.nvim_set_keymap("n","<space>sl", ":Telescope possession list<cr>", { noremap = true })

--| TagBar |--
a.nvim_set_keymap("n","<space>tb", ":TagbarToggle<cr>", { noremap = true })

--| Markdown Preview |--
a.nvim_set_keymap("n","<space>mp", ":MarkdownPreviewToggle<cr>", { noremap = true })

--| Packer keybinds |--
a.nvim_set_keymap("n","<space>pi", ":PackerInstall<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>pc", ":PackerClean<cr>", { noremap = true })
a.nvim_set_keymap("n","<space>pp", ":PackerCompile<cr>", { noremap = true })

--| Github Copilot |--
a.nvim_set_keymap("n","<space>gc", ":lua require('copilot').start()<cr>", { noremap = true })

--| COQ |--
a.nvim_set_keymap("n","<space>co", ":COQnow<cr>", { noremap = true })

--| Colemak-DH Remaps |--
vim.keymap.set('n', 't', 'i') -- insert
vim.keymap.set('n', 'T', 'I') -- insert at bol

vim.keymap.set('', 'm', 'h') -- left
vim.keymap.set('', 'n', 'j') -- down
vim.keymap.set('', 'e', 'k') -- up
vim.keymap.set('', 'i', 'l') -- right

vim.keymap.set('', 'M', 'H') -- screen top
vim.keymap.set('', 'I', 'L') -- screen bottom
vim.keymap.set('', 'K', 'M') -- screen mid'l


vim.keymap.set('', 'j', 'n') -- Find prev
vim.keymap.set('', 'J', 'N') -- Find next

vim.keymap.set('', 'h', 'e') -- end WORD
vim.keymap.set('', 'H', 'E') -- end word

vim.keymap.set('', 'k', 't') -- back 'till
vim.keymap.set('', 'K', 'T') -- back 'till

vim.keymap.set('', '<c-w>m', '<c-w>h') -- left
vim.keymap.set('', '<c-w>n', '<c-w>j') -- down
vim.keymap.set('', '<c-w>e', '<c-w>k') -- up
vim.keymap.set('', '<c-w>i', '<c-w>l') -- right


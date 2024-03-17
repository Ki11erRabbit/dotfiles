
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('https://github.com/koka-lang/koka', { ['rtp'] = 'support/vim' })

vim.call('plug#end')

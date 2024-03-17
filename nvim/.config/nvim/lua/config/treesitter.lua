require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "haskell", "javascript", "html", "c++" },
          sync_install = false,
          highlight = { enable = false },
          indent = { enable = true },  
        })
    end,
 }})

 require('nvim-treesitter.configs').setup {
     rainbow = {
         enable = true,
     },
 }



plugins = {
    'lambdalisue/suda.vim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons'}
    },
    --'NTBBloodbath/doom-one.nvim',
    'romgrk/doom-one.vim',
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    "lukas-reineke/indent-blankline.nvim",

    "karb94/neoscroll.nvim",

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    "ludovicchabant/vim-gutentags",
    "stevearc/aerial.nvim",
    "folke/which-key.nvim",
    "lewis6991/gitsigns.nvim",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",

    {
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'gaborvecsei/memento.nvim',

    'norcalli/nvim-colorizer.lua',

    'cohama/lexima.vim',

    { 'nvim-focus/focus.nvim', version = '*' },

    -- install with yarn or npm
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },

    'HiPhish/rainbow-delimiters.nvim',

    'nvim-treesitter/nvim-treesitter',
    'onsails/lspkind.nvim',


    {
        "Olical/conjure",
        ft = { "clojure", "fennel", "python" }, -- etc
        -- [Optional] cmp-conjure for cmp
        dependencies = {
            {
                "PaterJason/cmp-conjure",
            },
        },
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
               -- Set configuration options here
            vim.g["conjure#debug"] = true
        end,
    },

    'yamatsum/nvim-cursorline',
    'Ki11erRabbit/fm-nvim',
    'elkasztano/nushell-syntax-vim',
    'junegunn/vim-plug',
    'chrisbra/unicode.vim',



}

require('lazy').setup(plugins)


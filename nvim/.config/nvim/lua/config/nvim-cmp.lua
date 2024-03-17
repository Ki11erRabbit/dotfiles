require('copilot_cmp').setup()

local cmp = require('cmp')





local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end






cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'luasnip', group_index = 2 },
        { name = 'copilot', group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'buffer', group_index = 2 },
        { name = 'path', group_index = 2 },
        { name = 'cmdline', group_index = 2},
        { name = 'conjure', group_index = 2},

    },
    completion = {
        completeopt = 'menu,menuone',
    },
    mapping = {
        ['<C-e>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<Tab>'] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
    },
    sorting = {
	    priority_weight = 2,
	    comparators = {
		require("copilot_cmp.comparators").prioritize,
		cmp.config.compare.offset,
		-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
		cmp.config.compare.exact,
		cmp.config.compare.score,
		cmp.config.compare.recently_used,
		cmp.config.compare.locality,
		cmp.config.compare.kind,
		cmp.config.compare.sort_text,
		cmp.config.compare.length,
		cmp.config.compare.order,
	    },
    },
}




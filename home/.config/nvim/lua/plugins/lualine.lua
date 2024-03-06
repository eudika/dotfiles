return {
    'nvim-lualine/lualine.nvim',
    opts = function()
        if vim.opt.ambiwidth then
            -- treat , , and  as single width
            vim.fn.setcellwidths({ { 0xe0b0, 0xe0b3, 1 } })

            -- this doesn't work since luajit doesn't have utf8 library
            -- vim.fn.setcellwidths({ { utf8.codepoint(''), utf8.codepoint(''), 1 } })
        end
        return {
            options = {
                theme = 'wombat',
            },
        }
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
}

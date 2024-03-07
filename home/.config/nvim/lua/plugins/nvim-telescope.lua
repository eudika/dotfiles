return {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
        { '<Leader>:', '<Cmd>Telescope<Cr>' },
        { '<Leader><Space>', '<Cmd>Telescope oldfiles<Cr>' },
        { '<Leader>r', '<Cmd>Telescope resume<Cr>' },
        { '<Leader>f', '<Cmd>Telescope find_files<Cr>' },
        { '<Leader>t', '<Cmd>Telescope treesitter<Cr>' },
        { '<Leader>g', '<Cmd>Telescope live_grep<Cr>' },
        { '<Leader>b', '<Cmd>Telescope buffers<Cr>' },
        { '<Leader>k', '<Cmd>Telescope keymaps<Cr>' },
        { '<Leader>q', '<Cmd>Telescope quickfix<Cr>' },
        { '<Leader>/', '<Cmd>Telescope current_buffer_fuzzy_find<Cr>' },
        { '<Leader>?', '<Cmd>Telescope help_tags<Cr>' },
        { '<Leader>B', '<Cmd>Telescope git_branches<Cr>' },
    },
    opts = function()
        local actions = require('telescope.actions')
        return {
            defaults = {
                mappings = {
                    i = {
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-q>'] = actions.close,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                    },
                    n = {
                        ['q'] = actions.close,
                    },
                },
            },
        }
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end
        },
    },
}

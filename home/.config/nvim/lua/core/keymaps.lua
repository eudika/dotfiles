local default_opts = { noremap = true, silent = true }
local keymap = function(m, lhs, rhs, opts)
    vim.api.nvim_set_keymap(m, lhs, rhs, opts or default_opts)
end

vim.g.mapleader = ' '

-- << Normal / Visual / Select / Operator-pending Mode >>

-- go leftmost / rightmost
keymap('', '<Space>', '<Nop>')
keymap('', '<Space>h', '^')
keymap('', '<Space>l', '$')


-- << Normal Mode >>

-- move among tabs
keymap('n', 'gh', 'gT')
keymap('n', 'gl', 'gt')

-- insert an empty line below
keymap('n', '<Cr>', 'o<Esc>0D')  -- deleting indent or such

-- delete a character without yanking
keymap('n', 'x', '"_x')

-- reset highlighting
keymap('n', '<C-l>', '<Cmd>set nohlsearch<Cr><C-l>')


-- < Window / Tab / Buffer >

-- define prefix
keymap('n', '[s]', '<Nop>')  -- for idenpotency
keymap('n', 's', '[s]', { noremap = false })

-- window manupulation
keymap('n', '[s]s', '<Cmd>split<Cr>')
keymap('n', '[s]v', '<Cmd>vsplit<Cr>')
keymap('n', '[s]j', '<C-w>j')
keymap('n', '[s]k', '<C-w>k')
keymap('n', '[s]h', '<C-w>h')
keymap('n', '[s]l', '<C-w>l')
keymap('n', '[s]J', '<C-w>J')
keymap('n', '[s]K', '<C-w>K')
keymap('n', '[s]H', '<C-w>H')
keymap('n', '[s]L', '<C-w>L')

-- tab manupulation
keymap('n', '[s]T', '<Cmd>tabnew<Cr>')
keymap('n', '[s]N', 'gt')
keymap('n', '[s]P', 'gT')

-- buffer manupulation
keymap('n', '[s]n', '<Cmd>bn<Cr>')
keymap('n', '[s]p', '<Cmd>bp<Cr>')
keymap('n', '[s]b', '<Cmd>b<Cr>')
keymap('n', '[s]q', '<Cmd>bd<Cr>')
keymap('n', '[s]Q', '<Cmd>q<Cr>')


-- << Visual Mode >>

-- paste without yanking
keymap('x', 'p', 'P')


-- << Insert Mode >>

-- this configuration is done by better-escape plugin
-- keymap('i', 'jj', '<Esc>')

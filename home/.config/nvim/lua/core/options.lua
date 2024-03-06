vim.scriptencoding = 'utf-8'

local options = {
    -- localize
    encoding = 'utf-8',
    fileencoding = 'utf-8',
    fileencodings = { 'utf-8', 'cp932', 'ucs-bom' },
    formatoptions = vim.opt.formatoptions._info.default .. 'mM',
    ambiwidth = 'double',

    -- environment
    mouse = 'a',
    clipboard = 'unnamedplus',

    -- display
    title = true,
    number = true,
    signcolumn = 'yes',
    showmode = false,
    breakindent = true,
    list = true,
    listchars = {
        tab = '» ',
        trail = '~',
        nbsp = '␣',
    },
    scrolloff = 5,
    termguicolors = vim.fn.has('termguicolors') == 1,

    -- edit
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,

    -- search
    ignorecase = true,
    smartcase = true,

    -- split
    splitbelow = true,
    splitright = true,

    -- files
    backup = true,
    backupdir = vim.g.data_home .. '/backup',
    undofile = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

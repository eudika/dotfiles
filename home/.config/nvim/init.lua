-- << Global Variables >>

-- < Environment >
vim.g.is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1
vim.g.is_mac = vim.fn.has('mac') == 1
vim.g.is_linux = vim.fn.has('unix') == 1 and vim.fn.has('mac') ~= 1
vim.g.is_gui = vim.fn.has('gui_running') == 1

-- < Directories >
-- default:
--   unix:     ~/.config/nvim
--   windows:  %LOCALAPPDATA%\nvim
vim.g.config_home = vim.env.XDG_CONFIG_HOME and vim.env.XDG_CONFIG_HOME .. '/nvim' or vim.fn.stdpath('config')
-- default:
--   unix:    ~/.local/share/nvim
--   windows: %LOCALAPPDATA%\nvim-data
vim.g.data_home = vim.env.XDG_DATA_HOME and vim.env.XDG_DATA_HOME .. '/nvim' or vim.fn.stdpath('data')
-- default:
--   unix:    ~/.cache/nvim
--   windows: %TEMP%\nvim
vim.g.cache_home = vim.env.XDG_CACHE_HOME and vim.env.XDG_CACHE_HOME .. '/nvim' or vim.fn.stdpath('cache')


-- << Modules >>
require('core.options')
require('core.commands')
require('core.keymaps')
require('setup-plugins')

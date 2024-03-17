local servers = {
    'lua_ls',
}
local configurations = {
    lua_ls = function(opts)
        opts.settings = {
            Lua = { diagnostics = { globals = { 'vim' } } },
        }
    end,
}

return {
    'williamboman/mason-lspconfig.nvim',
    opts = {
        ensure_installed = servers,
        automatic_instllation = true,
    },
    dependencies = {
        {
            'williamboman/mason.nvim',
            build = ':MasonUpdate',
            opts = {},
        },
        {
            'neovim/nvim-lspconfig',
            config = function(_, opts)
                local lspconfig = require("lspconfig")

                for _, server in pairs(servers) do
                    local configure = configurations[server]
                    if configure ~= nil then configure(opts) end
                    lspconfig[server].setup(opts)
                end
            end,
        },
    },
}

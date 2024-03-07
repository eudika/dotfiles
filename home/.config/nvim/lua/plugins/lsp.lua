local servers = {
    'lua_ls',
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
                    if server == 'lua_ls' then
                        opts.settings = {
                            Lua = { diagnostics = { globals = { 'vim' } } },
                        }
                    end
                    lspconfig[server].setup(opts)
                end
            end,
        },
    },
}

local reload_config = function(_)
    for name, _ in pairs(package.loaded) do
        if name:match("^core") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.g.config_home .. '/init.lua')
end

vim.api.nvim_create_user_command('Reload', reload_config, {})

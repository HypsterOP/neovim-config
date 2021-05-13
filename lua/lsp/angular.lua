-- TODO: it's WIP, but it's working *woop woop*
-- :LspInstall anoular
local cmd = {
    DATA_PATH .. "/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver", "--stdio",
    '--tsProbeLocations', '/Users/jan/.nvm/versions/node/v12.18.2/lib/node_modules/',
    '--ngProbeLocations', '/Users/jan/.nvm/versions/node/v12.18.2/lib/node_modules/',
    }

require'lspconfig'.angularls.setup{
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    root_dir = require('lspconfig/util').root_pattern("angular.json", ".git"),
    on_attach = require'lsp'.on_attach,
}

-- TODO: debug
print(DATA_PATH .. "/lspinstall/angular/node_modules/@angular/language-server/bin/ngserver")

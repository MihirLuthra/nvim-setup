-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "clangd",
  "cssls",
  "html",
  "jdtls",
  "lua_ls",
  "pyright",
  -- "gopls"
}

-- Adds support to lua-language-server for init.lua
-- and plugin development
require("neodev").setup {}

-- lsps witdefault config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
        gopls = {
            buildFlags = {"-tags=pkcs11"},
        },
    },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  commands = {
    -- https://www.reddit.com/r/rust/comments/w7cf7d/comment/ihjur2p/
    -- https://github.com/Shatur/neovim-config/blob/master/plugin/lsp.lua#L155-L167
    RustOpenDocs = {
      function()
        print "RustOpenDocs: Invoked" -- Debug print
        vim.lsp.buf_request(
          vim.api.nvim_get_current_buf(),
          "experimental/externalDocs",
          vim.lsp.util.make_position_params(),
          function(err, url)
            if err then
              print("RustOpenDocs: Error - " .. tostring(err)) -- Debug print
              error(tostring(err))
            else
              print("RustOpenDocs: URL - " .. tostring(url)) -- Debug print
              vim.fn.system("xdg-open '" .. url .. "'")
              -- vim.fn["netrw#BrowseX"](url, 0)
            end
          end
        )
      end,
      description = "Open documentation for the symbol under the cursor in default browser",
    },
  },
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    -- https://github.com/bash-lsp/bash-language-server/blob/main/server/src/config.ts
    -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua
    bashIde = {
      backgroundAnalysisMaxFiles = 1000,
      globPattern = "**/*@(.sh|.inc|.bash|.command)",
      includeAllWorkspaceSymbols = true,
      logLevel = "debug",
    },
  },
}

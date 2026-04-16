require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "tailwindcss", "clangd", "eslint-lsp", "biome", "gopls", "pyright" } -- clangd for c/c++, ts_ls for typescript, cmake for cmake, gopls for golang, phpactor for php, pyright for python
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

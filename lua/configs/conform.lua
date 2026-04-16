local util = require "conform.util"

local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    -- Prefer Biome, fall back to ESLint/Prettier
    javascript = { "biome", "eslint_fix", "prettier", stop_after_first = true },
    typescript = { "biome", "eslint_fix", "prettier", stop_after_first = true },
    -- javascriptreact = { "biome", "eslint_fix", "prettier", stop_after_first = true },
    -- typescriptreact = { "biome", "eslint_fix", "prettier", stop_after_first = true },

    -- Biome supports formatting HTML/CSS too
    html = { "biome", "prettier", stop_after_first = true },
    css = { "biome", "prettier", stop_after_first = true },
  },

  -- ESLint v10 doesn't support --fix-to-stdout; run on a temp file instead.
  formatters = {
    eslint_fix = {
      command = "eslint",
      args = { "--fix", "$FILENAME" },
      cwd = util.root_file { "eslint.config.js", ".eslintrc.js", "package.json" },
      stdin = false,
      tmpfile_format = ".conform.$RANDOM.$FILENAME",
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    -- Use LSP formatting if no formatter is set for a filetype
    lsp_fallback = true,
  },
}

return options

local lint = require "lint"

local function preferred_linters_for_buf(bufnr)
  -- Prefer Biome, fall back to ESLint
  if vim.fn.executable("biome") == 1 and lint.linters.biomejs then
    return { "biomejs" }
  end
  if vim.fn.executable("eslint") == 1 and lint.linters.eslint then
    return { "eslint" }
  end
  return {}
end

lint.linters_by_ft = {
  javascript = { "biomejs", "eslint" },
  typescript = { "biomejs", "eslint" },
  javascriptreact = { "biomejs", "eslint" },
  typescriptreact = { "biomejs", "eslint" },
  -- If you want HTML/CSS linting, Biome can do it, but nvim-lint may not ship a
  -- dedicated linter definition for those filetypes by default.
}

-- Create an autocmd to trigger linting on save/open
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function(args)
    local names = preferred_linters_for_buf(args.buf)
    if #names > 0 then
      lint.try_lint(names)
    end
  end,
})

require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", "<cmd> NvimTreeToggle <cr>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

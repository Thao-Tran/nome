-- Use onedark_vivid colorscheme provided by onedarkpro.nvim
vim.cmd.colorscheme "onedark_vivid"

vim.keymap.set(
  "n",
  "<Leader>tt",
  vim.diagnostic.open_float,
  { desc = "Open diagnostic in floating message" }
)

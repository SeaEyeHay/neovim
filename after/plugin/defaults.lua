vim.bo.shiftwidth = 4
vim.bo.tabstop = 1
vim.bo.softtabstop = 4
vim.bo.textwidth = 120


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

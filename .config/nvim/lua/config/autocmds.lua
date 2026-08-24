-- Auto save command
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      lsp_fallback = true,
      timeout_ms = 1000,
    })
  end,
})

-- Diagnostic signs
vim.diagnostic.config({
  virtual_text = false,

  signs = true,

  underline = true,

  update_in_insert = false,

  severity_sort = true,

  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

local signs = {
  Error = "E",
  Warn = "W",
  Hint = "H",
  Info = "I",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type

  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = "",
  })
end

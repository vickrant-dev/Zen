return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {},
    },

    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "ts_ls",
          "lua_ls",
        },

        automatic_enable = false,
      },
    },

    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
    })

    vim.lsp.enable({
      "ts_ls",
      "lua_ls",
    })
  end,
}

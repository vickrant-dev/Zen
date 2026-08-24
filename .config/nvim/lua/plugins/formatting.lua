return {
  "stevearc/conform.nvim",

  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },

      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      json = { "prettier" },
      jsonc = { "prettier" },

      css = { "prettier" },
      scss = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },

      sql = {
        "sql_formatter",
        args = {
          "--language",
          "postgresql",
        }
      },
    },

    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({
        async = true,
        lsp_fallback = true,
      })
    end, {})
  end,
}

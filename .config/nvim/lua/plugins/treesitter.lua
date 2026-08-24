return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "json",
      "jsonc",
      "html",
      "css",
      "sql",
      "lua",
      "markdown",
      "markdown_inline",
      "bash",
      "vim",
      "vimdoc",
      "query",
    },
    
    auto_install = false,

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },
}

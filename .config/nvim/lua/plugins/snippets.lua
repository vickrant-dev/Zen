return {
  "L3MON4D3/LuaSnip",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },

  config = function(_, opts)
    local luasnip = require("luasnip")

    luasnip.setup(opts)

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

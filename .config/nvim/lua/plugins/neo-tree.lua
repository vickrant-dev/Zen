return {
  "nvim-neo-tree/neo-tree.nvim",

  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    {
      "\\",
      "<cmd>Neotree focus left<cr>",
      desc = "Focus file explorer",
    },
  },

  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}

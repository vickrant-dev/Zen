return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },
  },

  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Search text",
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Find buffers",
    },
  },
}

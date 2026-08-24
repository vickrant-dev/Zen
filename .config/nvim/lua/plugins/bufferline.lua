return {
  "akinsho/bufferline.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    options = {
      mode = "buffers",

      diagnostics = "nvim_lsp",

      always_show_bufferline = true,

      show_buffer_close_icons = false,
      show_close_icon = false,

      separator_style = "thin",

      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
}

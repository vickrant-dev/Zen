-- If generated theme exists, skip loading the fallback colorscheme plugin
local theme_file = vim.fn.stdpath("config") .. "/lua/theme.lua"
if vim.fn.filereadable(theme_file) == 1 then
  return {}
end

-- Otherwise, load Gruvbox Material as fallback
return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_ui_contrast = "low"
    vim.g.gruvbox_material_float_style = "bright"
    vim.g.gruvbox_material_diagnostic_text_highlight = 0
    vim.g.gruvbox_material_diagnostic_line_highlight = 0
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_sign_column_background = "none"
    vim.g.gruvbox_material_show_eob = 0
    vim.cmd.colorscheme("gruvbox-material")
  end,
}

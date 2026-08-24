-- Intentionally minimal.
--
-- Prefer native Vim commands and motions.
-- Plugin-specific mappings will live with the plugin
-- that owns them.

vim.keymap.set("n", "gl", vim.diagnostic.open_float, {
  desc = "Show diagnostic",
})


local project = require("config.project")

-- Show git root of current file.
vim.api.nvim_create_user_command("GitRoot", project.show_git_root, {})

-- Navigate to git root of current file.
vim.keymap.set("n", "<leader>cd", project.cd_to_git_root, {
  desc = "Change directory to Git root",
})


-- Switch focus on windows (left, right, bottom, top).
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Focus window left",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Focus window right",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Focus window below",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Focus window above",
})


-- Move through buffers (previous, next)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", {
  desc = "Next buffer",
})


-- Close current file
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", {
  desc = "Delete current buffer",
})


-- Save and close file (for open files in buffer)
vim.keymap.set("n", "<leader>bw", function()
  vim.cmd("write")
  vim.cmd("bdelete")
end, {
  desc = "Write and delete buffer",
})


-- Save file with auto formatting
vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", {
  desc = "Save",
})

vim.keymap.set("i", "<C-s>", "<C-o>:write<CR>", {
  desc = "Save",
})


-- Git shortcuts for navigation
vim.keymap.set("n", "]h", function()
  require("gitsigns").nav_hunk("next")
end, {
  desc = "Next Git hunk",
})

vim.keymap.set("n", "[h", function()
  require("gitsigns").nav_hunk("prev")
end, {
  desc = "Previous Git hunk",
})

vim.keymap.set("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, {
  desc = "Preview Git hunk",
})

vim.keymap.set("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, {
  desc = "Stage Git hunk",
})

vim.keymap.set("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, {
  desc = "Reset Git hunk",
})


-- Diagnostics quickfix
vim.keymap.set("n", "<leader>xx", function()
  vim.diagnostic.setqflist()
end, {
  desc = "Diagnostics quickfix",
})

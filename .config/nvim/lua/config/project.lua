local M = {}

function M.git_root()
  local file = vim.api.nvim_buf_get_name(0)

  if file == "" then
    return nil
  end

  local dir = vim.fs.dirname(file)

  local git_dir = vim.fs.find(".git", {
    path = dir,
    upward = true,
    type = "directory",
  })[1]

  if not git_dir then
    return nil
  end

  return vim.fs.dirname(git_dir)
end

function M.show_git_root()
  local root = M.git_root()

  if root then
    vim.notify(root, vim.log.levels.INFO, {
      title = "Git root",
    })
  else
    vim.notify("No Git repository found", vim.log.levels.WARN, {
      title = "Git root",
    })
  end
end

function M.cd_to_git_root()
  local root = M.git_root()

  if not root then
    vim.notify("No Git repository found", vim.log.levels.WARN, {
      title = "Git root",
    })
    return
  end

  vim.cmd("cd " .. vim.fn.fnameescape(root))

  vim.notify("Working directory: " .. root, vim.log.levels.INFO, {
    title = "Git root",
  })
end

return M

if not vim.g.vscode then
  -- ordinary neovim
  -- 在命令行中打开的情况下加载
  require('base')
  require('key')
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    spec = { import = "plugins" },
    ui = {
      border = "rounded"
    },
  })

  if vim.fn.has('wsl') == 1 then
    -- 在wsl中打开的情况下加载
    vim.g.clipboard = {
      name = 'myClipboard',
      copy = {
        ['+'] = 'clip.exe',
        ['*'] = { 'tmux', 'load-buffer', '-' },
      },
      paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = { 'tmux', 'save-buffer', '-' },
      }
    }
  end
else
  -- 在VSCode的情况下打开
  vim.opt.ignorecase = true
  vim.opt.clipboard:append("unnamedplus")
  vim.g.clipboard = vim.g.vscode_clipboard
  vim.keymap.set("i", "jk", "<esc>")
  vim.g.mapleader = " "
  vim.keymap.set("n", "<leader>b", "<cmd>bn<CR>", { desc = "next buffer" })
  vim.keymap.set("n", "<leader>B", "<cmd>bp<CR>", { desc = "previous buffer" })
end

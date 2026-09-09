return {
  -- 1. tmux 导航插件（可选，但装上也没坏处）
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      -- 禁用自带映射，避免与 Herdr 导航冲突
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  {
    "bojackduy/nvim-herdr-navigation",
    submodules = false,
    cond = function()
      return vim.env.HERDR_PANE_ID ~= nil
    end,
    event = "VeryLazy",
    init = function(plugin)
      vim.opt.rtp:prepend(plugin.dir .. "/nvim-herdr-navigation")
    end,
    config = function()
      vim.schedule(function()
        require("herdr-navigation").setup({
          keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
          },
        })
      end)
    end,
  },
}

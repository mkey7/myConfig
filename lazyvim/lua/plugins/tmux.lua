return {
  "aserowy/tmux.nvim",
  keys = {
    {
      "<c-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "tmux 左移",
    },
    {
      "<c-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "tmux 下移",
    },
    {
      "<c-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "tmux 上移",
    },
    {
      "<c-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "tmux 右移",
    },
  },
  opts = {
    navigation = {
      -- 关键：禁用插件的默认键位，由上面的 keys 接管
      enable_default_keybindings = false,
    },
  },
}

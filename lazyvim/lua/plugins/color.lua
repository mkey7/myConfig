return {
  { "scottmckendry/cyberdream.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream-light",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- 方式一：更换整个主题（最简单）
      -- 可选主题: 'auto', 'gruvbox', 'dracula', 'tokyonight', 'horizon', 'onedark', 'nord', 'catppuccin' 等
      opts.options = opts.options or {}
      opts.options.theme = "solarized_light" -- 改成你喜欢的主题名称

      return opts
    end,
  },
}

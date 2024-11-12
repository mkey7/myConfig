return {
  {
    "kjssad/quantum.vim",
    config = function()
      vim.opt.background = "light"
      vim.cmd.colorscheme("quantum")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" }, -- 如果你需要图标支持
    opts = {
      -- 在这里添加你的 Lualine 配置
      theme = "onelight",
    },
  },
}

return {
  "hedyhli/outline.nvim",
  keys = { { "<leader>O", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
  cmd = "Outline",
    config = function()
        require("outline").setup{

        }
    end,

}

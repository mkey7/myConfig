return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        lazy = false,
        enabled = true,
        config = function()
            require("hardtime").setup({
                disable_mouse = false,
                disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "grug-far", "dbui", "Trouble", "trouble" },
            })
        end
    },
}

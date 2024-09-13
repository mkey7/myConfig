return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<leader>f",  ":Telescope find_files<CR>", desc = "find files" },
			{ "<leader>F",  ":Telescope live_grep<CR>",  desc = "grep file" },
			{ "<leader>rs", ":Telescope resume<CR>",     desc = "resume" },
			{ "<C-q>",      ":Telescope oldfiles<CR>",   desc = "oldfiles" },
		},

	},
}


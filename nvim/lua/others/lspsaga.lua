return{
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
					devicon = true,
					foldericon = true,
					title = true,
					expand = "⊞",
					collapse = "⊟",
					code_action = "💡",
					actionfix = " ",
					lines = { "┗", "┣", "┃", "━", "┏" },
					kind = nil,
					imp_sign = "󰳛 ",
				},
				code_action = {
					num_showcut = true,
					show_server_name = false,
					keys = {
						quit = "q",
						exec = "<CR>",
					},
				},
				lightbulb = {
					enable = true,
					enable_in_insert = true,
					sign = true,
					sign_priority = 40,
					virtual_text = true,
				},
				rename = {
					quit = "<C-c>",
					exec = "<CR>",
					mark = "x",
					confirm = "<CR>",
					in_select = true,
				},
				symbol_in_winbar = {
					enable = true,
					separator = "/",
					ignore_patterns = {},
					hide_keyword = true,
					show_file = true,
					folder_level = 2,
					respect_root = false,
					color_mode = true,
				},
				implement = {
					enable = true,
					sign = true,
					virtual_text = true,
					priority = 100,
				},
				on_attach = function(client, bufnr)
				-- 按键绑定选项
				local opts = { noremap=true, silent=true }

				-- 绑定按键
				vim.api.nvim_buf_set_keymap('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
				vim.api.nvim_buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
				vim.api.nvim_buf_set_keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
				vim.api.nvim_buf_set_keymap('n', 'gf', '<Cmd>Lspsaga finder def+ref<CR>', opts)
				vim.api.nvim_buf_set_keymap('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
				end,
			})
		end,
	},
}

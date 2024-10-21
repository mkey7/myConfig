return {
  {
    "mfussenegger/nvim-dap",
	event = "VeryLazy",
    keys = {
      {
        "<F5>",
        function() require("dap").continue() end,
        desc = "Launch/Continue debugging"
      },
      {
        "<F10>",
        function() require("dap").step_over() end,
        desc = "Step over"
      },
      {
        "<F11>",
        function() require("dap").step_into() end,
        desc = "Step into"
      },
      {
        "<C-F11>",
        function() require("dap").step_out() end,
        desc = "Step out"
      },
      {
        "<F12>",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle breakpoint"
      },
      {
        "<leader>dc",
        function() 
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) 
        end,
        desc = "Set conditional breakpoint"
      },
      {
        "<leader>dl",
        function() 
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) 
        end,
        desc = "Set log point"
      },
    },
    config = function()
      local dap = require("dap")
      dap.adapters.python = {
        type = 'executable';
        command = 'python3';  -- Adjust this to the correct python path
        args = { '-m', 'debugpy.adapter' };
      };
      dap.configurations.python = {
        {
          type = 'python';
          request = 'launch';
          name = 'Launch file';
          program = '${file}';  -- This will launch the current file
          pythonPath = function()
            -- Use virtualenv's Python if available, or fallback to system Python
            local venv_path = os.getenv('VIRTUAL_ENV')
            if venv_path then
              return venv_path .. '/bin/python'
            else
              return 'python3'  -- Adjust to your Python version
            end
          end;
        },
      };

      -- Optionally enable logging for debugging dap issues
      dap.set_log_level('TRACE')
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	opts = function()
		local dap, dapui = require("dap"), require("dapui")

		-- 自动打开 dap-ui 调试界面
		dap.listeners.after.event_initialized["dapui_config"] = function()
		  dapui.open()
		end

		-- 在调试终止或退出时自动关闭 dap-ui
		dap.listeners.before.event_terminated["dapui_config"] = function()
		  dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
		  dapui.close()
		end

		-- 返回 dap-ui 的配置
		return {
		  icons = { expanded = "▾", collapsed = "▸" },
		  mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
		  },
		  sidebar = {
			elements = {
			  { id = "scopes", size = 0.25 },
			  { id = "breakpoints", size = 0.25 },
			  { id = "stacks", size = 0.25 },
			  { id = "watches", size = 0.25 },
			},
			size = 40,
			position = "left",
		  },
		  tray = {
			elements = { "repl" },
			size = 10,
			position = "bottom",
		  },
		}
	end,
  },
  {
    "nvim-neotest/nvim-nio",  -- Add this to resolve the error
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
	  enabled = true, -- 启用此插件
      enabled_commands = true, -- 启用命令，如 DapVirtualTextEnable, DapVirtualTextDisable 等
      highlight_changed_variables = true, -- 高亮已更改的变量值
      highlight_new_as_changed = false, -- 将新变量高亮显示为已更改的变量
      show_stop_reason = true, -- 在停止时显示停止原因
      commented = false, -- 是否在虚拟文本前加上注释字符
      only_first_definition = true, -- 仅在变量的第一个定义位置显示虚拟文本
      all_references = false, -- 是否在所有引用处显示虚拟文本
      filter_references_pattern = "<module", -- 当启用 all_references 时，过滤某些引用的正则表达式
      virt_text_pos = "eol", -- 虚拟文本显示在行尾
      all_frames = false, -- 仅显示当前栈帧的虚拟文本
      virt_lines = false, -- 使用虚拟行而不是虚拟文本（可能会闪烁）
      virt_text_win_col = nil, -- 固定列位置显示虚拟文本
    },
  },
}


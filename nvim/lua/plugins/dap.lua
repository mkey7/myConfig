return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = {
            {
                "<leader>dd",
                function() require("dap").continue() end,
                desc = "Launch/Continue debugging"
            },
            {
                "<leader>dx",
                function() require("dap").step_over() end,
                desc = "Step over"
            },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc = "Step into"
            },
            {
                "<leader>do",
                function() require("dap").step_out() end,
                desc = "Step out"
            },
            {
                "<leader>db",
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
            {
                "<leader>dq",
                function() require("dap").terminate() end,
                desc = "quit debugging"
            },
        },
        config = function()
            -- local dap = require("dap")
            local dap, dapui = require("dap"), require("dapui")
            local install_root_dir = vim.fn.stdpath("data") .. "/mason"
            local extension_path = install_root_dir .. "/packages/codelldb/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            -- c/c++/rust
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                -- args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
                args = { "-i", "dap" },
            }
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = {"--port", "${port}"},
                }
            }
            dap.configurations.c = {
                {
                    name = "codelldb",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                },
                {
                    name = "gdb",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                },
                -- {
                --   name = "Select and attach to process",
                --   type = "gdb",
                --   request = "attach",
                --   program = function()
                --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --   end,
                --   pid = function()
                --     local name = vim.fn.input('Executable name (filter): ')
                --     return require("dap.utils").pick_process({ filter = name })
                --   end,
                --   cwd = '${workspaceFolder}'
                -- },
                -- {
                --   name = 'Attach to gdbserver :1234',
                --   type = 'gdb',
                --   request = 'attach',
                --   target = 'localhost:1234',
                --   program = function()
                --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                --   end,
                --   cwd = '${workspaceFolder}'
                -- },
            }
            dap.configurations.cpp = dap.configurations.c


            -- python
            dap.adapters.python = {
                type = 'executable',
                command = 'python3', -- Adjust this to the correct python path
                args = { '-m', 'debugpy.adapter' },
            };
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = 'Launch file',
                    program = '${file}', -- This will launch the current file
                    pythonPath = function()
                        -- Use virtualenv's Python if available, or fallback to system Python
                        local venv_path = os.getenv('VIRTUAL_ENV')
                        if venv_path then
                            return venv_path .. '/bin/python'
                        else
                            return 'python3' -- Adjust to your Python version
                        end
                    end,
                },
            };

            -- Optionally enable logging for debugging dap issues
            dap.set_log_level('TRACE')
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        -- event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        opts = function()
            local dap, dapui = require("dap"), require("dapui")

            -- 自动打开 dap-ui 调试界面
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
                dap.repl.open()
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
                        { id = "scopes",      size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 0.25 },
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
        "nvim-neotest/nvim-nio", -- Add this to resolve the error
        lazy = true,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,                            -- 设置懒加载
        dependencies = { "mfussenegger/nvim-dap" }, -- 当 nvim-dap 启动时自动加载
        config = function()
            require("nvim-dap-virtual-text").setup({
                enabled = true,
                enabled_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = false,
                filter_references_pattern = "<module",
                virt_text_pos = "eol",
                all_frames = false,
                virt_lines = false,
            })
        end,
    }
}

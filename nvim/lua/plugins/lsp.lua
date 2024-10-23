-- Mason 和 Mason LSP 配置
return {
  {
    "williamboman/mason.nvim",
    lazy = true,                                      -- 修改为懒加载
    cmd = { "Mason", "MasonInstall", "MasonUpdate" }, -- 仅在执行这些命令时加载
    build = ":MasonUpdate",                           -- 保留 build 命令
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,                            -- 修改为懒加载
    event = { "BufReadPre", "BufNewFile" }, -- 在打开文件时加载 LSP
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    keys = {
        {
          "gD",                               -- 键位
          function() vim.lsp.buf.declaration() end, -- 执行的函数
          desc = "Go to declaration"          -- 描述
        },
        {
          "gd",                              -- 键位
          function() vim.lsp.buf.definition() end, -- 执行的函数
          desc = "Go to definition"          -- 描述
        },
        {
          "K",                          -- 键位
          function() vim.lsp.buf.hover() end, -- 执行的函数
          desc = "Hover documentation"  -- 描述
        },
        {
          "gi",                                  -- 键位
          function() vim.lsp.buf.implementation() end, -- 执行的函数
          desc = "Go to implementation"          -- 描述
        },
        {
          "<C-k>",                               -- 键位
          function() vim.lsp.buf.signature_help() end, -- 执行的函数
          desc = "Signature help"                -- 描述
        },
        {
          "<leader>wa",                                -- 键位
          function() vim.lsp.buf.add_workspace_folder() end, -- 执行的函数
          desc = "Add workspace folder"                -- 描述
        },
        {
          "<leader>wr",                                   -- 键位
          function() vim.lsp.buf.remove_workspace_folder() end, -- 执行的函数
          desc = "Remove workspace folder"                -- 描述
        },
        {
          "<leader>wl",                                                      -- 键位
          function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, -- 执行的函数
          desc = "List workspace folders"                                    -- 描述
        },
        {
          "<leader>D",                            -- 键位
          function() vim.lsp.buf.type_definition() end, -- 执行的函数
          desc = "Go to type definition"          -- 描述
        },
        {
          "<leader>rn",                  -- 键位
          function() vim.lsp.buf.rename() end, -- 执行的函数
          desc = "Rename symbol"         -- 描述
        },
        {
          "<leader>ca",                       -- 键位
          function() vim.lsp.buf.code_action() end, -- 执行的函数
          desc = "Code action"                -- 描述
        },
        {
          "gr",                              -- 键位
          function() vim.lsp.buf.references() end, -- 执行的函数
          desc = "Find references"           -- 描述
        },
        {
          "<leader>e",                          -- 键位
          function() vim.diagnostic.open_float() end, -- 执行的函数
          desc = "Open diagnostics float"       -- 描述
        },
        {
          "[d",                                -- 键位
          function() vim.diagnostic.goto_prev() end, -- 执行的函数
          desc = "Go to previous diagnostic"   -- 描述
        },
        {
          "]d",                                -- 键位
          function() vim.diagnostic.goto_next() end, -- 执行的函数
          desc = "Go to next diagnostic"       -- 描述
        },
        {
          "<leader>q",                          -- 键位
          function() vim.diagnostic.setloclist() end, -- 执行的函数
          desc = "Set diagnostic quickfix"      -- 描述
        },
        {
          "<leader>=",                                 -- 键位
          function() vim.lsp.buf.format({ async = true }) end, -- 执行的函数
          desc = "Format buffer"                       -- 描述
        },
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = function(client, bufnr)
              -- 设置按键绑定
              -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

              -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

              -- 按键绑定选项
              -- local opts = { noremap = true, silent = true }

              -- 绑定按键
              -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
              -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
              -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
              -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
              -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
              -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
              -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
              -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
              --   opts)
              -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
              -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
              -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
              -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
              -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
              -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
              -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
              -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
              -- buf_set_keymap('n', '<leader>=', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)

              -- 你可以在这里添加更多按键绑定
            end,
          })
        end,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = true,                            -- 修改为懒加载
    event = { "BufReadPre", "BufNewFile" }, -- 在打开文件时加载 LSP
    keys = {
      {
        "<leader>e",
        vim.diagnostic.open_float
        ,
        desc = "show diagnostic"
      },
      {
        "[d",
        vim.diagnostic.goto_prev
        ,
        desc = "pre diagnostic"
      },
      {
        "]d",
        vim.diagnostic.goto_next
        ,
        desc = "next diagnostic"
      },
      {
        "<leader>q",
        vim.diagnostic.setloclist
        ,
        desc = "list diagnostics"
      },
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
          or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
      })
    end,

  },
}

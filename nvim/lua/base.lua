-- -- 清除所有之前定义的 autocmd 并从干净的状态开始
-- vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,gbk,gb18030,gb2312,cp936'
vim.o.relativenumber = true
--set.clipboard = "unnamed"

vim.o.termguicolors = true

-- -- 仅在当前窗口显示行号
vim.wo.number = true
vim.o.title = true

-- 设置 cursorline
vim.wo.cursorline = true

-- 设置 cursorcolumn
vim.wo.cursorcolumn = true

-- Neovim 会自动在新行添加空格或制表符以匹配现有的缩进级别
vim.opt.autoindent = true
-- 高亮所有匹配的搜索模式
vim.opt.hlsearch = true

-- 禁止Neovim自动生成备份文件
vim.opt.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- -- 显示命令行渐入的命令
-- vim.opt.showcmd = true

-- -- 设置命令行高度为 1
-- vim.opt.cmdheight = 1

-- -- 每个分割窗口都有单独的状态行
-- vim.opt.laststatus = 2

 -- 使用空格而不是真实的制表符
vim.opt.expandtab = true

-- -- 光标以上和以下保持的最小屏幕行数
vim.opt.scrolloff = 3

-- -- 在分割窗口中进行增量搜索
-- vim.opt.inccommand = 'split'
-- -- 在搜索模式下忽略大小写
vim.opt.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- -- Vim 将根据当前上下文自动使用空格和制表符的混合进行缩进。
vim.opt.smarttab = true
-- -- 在 Vim 中显示换行线的可视指示
-- vim.opt.breakindent = true
-- -- 设置每个缩进级别使用的空格数
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- -- 自动缩进
vim.opt.ai = true
-- -- 智能缩进
vim.opt.si = true
-- -- 不换行
-- vim.opt.wrap = false
-- -- vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- 查找文件 - 向下搜索子文件夹
-- vim.opt.wildignore:append { '*/node_modules/*' }

-- -- 下划线
-- -- "\e[4:3m" 是用于下划线文本的 ANSI 转义序列，宽度为1像素
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- 使用系统截切版
vim.opt.clipboard:append("unnamedplus")

-- -- 在注释行回车时自动插入注释符号
--    vim.opt.formatoptions:append { 'r' }

-- -- 启用 'splitright' 选项，以便在右侧分割窗口
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 鼠标
vim.opt.mouse = ""

vim.opt.shada = ""

-- 文件树浏览
vim.g.netrw_banner = 0
--vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
--vim.g.netrw_altv = 1
--vim.g.netrw_list_hide = '\.o\|\.d|.tmp\>'
--vim.g.netrw_browse_split = 4

-- 折叠
vim.opt.foldmethod = syntax

-- 自动读取外部更改
vim.o.autoread = true

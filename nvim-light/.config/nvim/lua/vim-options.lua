vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")

vim.cmd("map <C-n> :Neotree toggle<CR>")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

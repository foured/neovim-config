vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.signcolumn = "yes"
vim.o.fillchars = "eob: "
vim.o.swapfile = false
vim.o.winborder = "rounded"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format)

vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
})

require("vague").setup({
	colors = {
		bg = "#000000",
	},
})

vim.cmd("colorscheme vague")

vim.lsp.enable({
	"lua_ls",
	"clangd",
})

vim.diagnostic.config({
  virtual_text = true,
})

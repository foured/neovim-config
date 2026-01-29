vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.fillchars = "eob: "
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.o.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- keymap
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)

-- plugins
vim.pack.add({
    { src = "https://github.com/vague-theme/vague.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

-- color scheme
require("vague").setup({
    colors = {
        bg = "#000000",
    },
})

vim.cmd("colorscheme vague")

-- lsp stuff
vim.lsp.enable({
    "lua_ls",
    "clangd",
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "popup", "menuone", "noinsert" }
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })
        end
    end
})

-- diagnostics 
vim.diagnostic.config({
    virtual_text = true,
})

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true
require("nvim-tree").setup({
    hijack_cursor = true,
    renderer = {
        icons = {
            show = {
                -- git = false,
            }
        }
    },
    filters = {
        custom = {
            ".DS_Store",
        },
    },
    git = {
        ignore = false,
    }
})

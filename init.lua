-- github.com/ServoDev
-- important default keybinds :
-- shift+k              read info about function under cursor
-- cntrl+w cntrl + d    read diagnostic info under cursor
-- cntrl+x cntrl+o 		autocomplete

-- vim options
vim.o.relativenumber = true
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.winborder = "rounded"
vim.g.netrw_banner = 0
vim.opt.path:append('**') -- enables easier searching for files

-- disable comment continuation ; wrapped up to ovoid overide
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- exit terminal mode with cntrl w
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true })
-- automatically enter terminal mode when entering a terminal buff
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "startinsert",
})

  
-- colorscheme
vim.pack.add({
	{src = "https://github.com/ellisonleao/gruvbox.nvim"},
	{src = "https://github.com/neovim/nvim-lspconfig"}
})
vim.cmd("colorscheme gruvbox");

-- treat ino as cpp
vim.filetype.add({
  extension = {
    ino = "cpp",
  },
})

-- clangd lsp
vim.lsp.enable({"clangd"})

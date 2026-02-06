-- vim options
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.winborder = "rounded"

-- disable comment continuation ; wrapped up to ovoid overide
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
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

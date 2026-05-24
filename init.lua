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

-- treat .ino as cpp file
vim.filetype.add({
  extension = {
    ino = "cpp",
  },
})


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

-- plugins
vim.pack.add({
        -- gruvbox scheme
	{src = "https://github.com/ellisonleao/gruvbox.nvim"},
        -- lsp defaults
	{src = "https://github.com/neovim/nvim-lspconfig"},
        -- treesitter
        {src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- treesitter
require 'nvim-treesitter.config'.setup {
  ensure_installed = {
    "java",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "go"
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java", "lua", "c", "cpp", "go" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})


-- colorscheme
vim.cmd("colorscheme gruvbox");

-- clangd lsp
vim.lsp.enable({"clangd"})

-- java lsp
vim.lsp.enable({"java_language_server"})


-- gd jumps to decleration rather than definition when using lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end,
})

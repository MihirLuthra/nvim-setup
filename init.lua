vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.cmd [[
  map <M-s> :tabnext<CR>
  map <M-a> :tabprev<CR>

  map <C-Up> 7<Up>
  map <C-Down> 7<Down>

  map <C-q> :NvimTreeToggle<CR>
  map <C-a> <C-w>w

  map <C-x> <leader>x

  set iskeyword+=-
  " Using your mouse doesn't work inside vim
  " like it because I can use mouse to copy something
  " without changing my vim cursor.
  set mouse=
]]

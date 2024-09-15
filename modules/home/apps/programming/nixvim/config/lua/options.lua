local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt

o.spelllang = "en_us"
o.cursorlineopt = "both"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

wo.number = true

-- NeoVide Settings
if g.neovide then
  o.guifont = "Comic Mono:h12.75", "Arimo Nerd Font:h13.15"
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  opt.linespace = 0

  wo.number = true
  opt.relativenumber = false
end

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.cmdheight = 0

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.colorcolumn = '80,100,120,140'
vim.o.laststatus = 3

-- vim.opt.list = true
-- vim.opt.listchars = {
--   trail = "·",
--   extends = "»",
--   precedes = "«",
--   eol = "↲",
-- }

-- move line below
vim.keymap.set({ 'n', 'i' }, '<M-j>', ':m .+1<CR>==')

-- move line above
vim.keymap.set({ 'n', 'i' }, '<M-k>', ':m .-2<CR>==')

-- move highlighted lines down
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv")

-- move highlighted lines ups
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv")

return {}

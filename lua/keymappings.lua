-- TODO remove this when change to nvim whichkey
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <M-k>  :resize -2<CR>
  nnoremap <silent> <M-j>  :resize +2<CR>
  nnoremap <silent> <M-h>  :vertical resize -2<CR>
  nnoremap <silent> <M-l>  :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<', '<<', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '>', '>>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '=', '=ii', {})
-- ident with tabs for visual mode
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})


-- Move line start line end
vim.api.nvim_set_keymap('', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'L', '$', {noremap = true, silent = true})

-- Search word in buffer
vim.api.nvim_set_keymap('n', 's', ':HopWord<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'S', ':HopChar1<CR>', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- go to ending of the copied/yank text
vim.api.nvim_set_keymap('v', 'y', 'y`]', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'p', 'p`]', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'p', 'p`]', {noremap = true, silent = true})

-- move in command mode with c-p c-n same as with up down
-- vim.api.nvim_set_keymap('c', '<C-p>', '<Up>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('c', '<C-n>', '<Down>', {noremap = true, silent = true})

-- Move by quickfix faster
vim.api.nvim_set_keymap('n', '<C-m>', ':cnext<CR>', {noremap = true, silent = true})

-- Last insertion mark
vim.api.nvim_set_keymap('n', 'g.', '`^', {silent = true})



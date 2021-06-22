require('hop').setup({create_hl_autocmd = true})

vim.api.nvim_set_keymap('n', 's', ":HopChar2<cr>", {silent = true})
vim.api.nvim_set_keymap('n', 'S', ":HopWord<cr>", {silent = true})

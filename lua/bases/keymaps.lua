-- [[ Basic Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- window
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<A-Up>', '<cmd>resize +2<cr>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-Down>', '<cmd>resize -2<cr>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-Left>', '<cmd>vertical resize +2<cr>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-Right>', '<cmd>vertical resize -2<cr>', { desc = 'Move focus to the upper window' })

-- escape terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- quit all
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- run current buffer luafile
vim.keymap.set('n', '<leader>rl', '<cmd>luafile %<cr>', { desc = 'Run current lua file' })

-- buffer
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd #<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to other buffer' })

-- terminal
vim.keymap.set({ 'n', 't', 'i' }, '<C-\\>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

-- [[ Basic Keymaps ]]

local map = vim.keymap.set

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- window
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<A-Up>', '<cmd>resize +4<cr>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-Down>', '<cmd>resize -4<cr>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-Left>', '<cmd>vertical resize +4<cr>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-Right>', '<cmd>vertical resize -4<cr>', { desc = 'Move focus to the upper window' })

map('n', '<leader>ww', '<C-W>p', { desc = 'Other Window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
map('n', '<leader>ws', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>wv', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>w=', '<C-W>=', { desc = 'Equally high and wide', remap = true })

map('n', '<leader>td', '<cmd>tabc<cr>', { desc = 'Close current tabs' })
map('n', '<leader>to', '<cmd>tabonly<cr>', { desc = 'Close other tabs' })

-- escape terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- quit all
vim.keymap.set('n', '<leader>q', '<cmd>qa<cr>', { desc = 'Quit All' })

-- run current buffer luafile
vim.keymap.set('n', '<leader>rl', '<cmd>luafile %<cr>', { desc = 'Run current lua file' })

-- buffer
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bp|bd #<cr>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to other buffer' })
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close other buffer' })

-- terminal
vim.keymap.set({ 'n', 't', 'i' }, '<C-`>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

-- quicklist
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

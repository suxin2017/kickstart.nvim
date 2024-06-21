local log = require('config').log
local i = require('nvim-web-devicons').get_icon('1.ts', 'ts')

vim.keymap.set('n', '<C-/>', function()
  print 'hello'
end)

vim.keymap.set('n', '<C-.>', function()
  print 'hello'
end)

print 'done'

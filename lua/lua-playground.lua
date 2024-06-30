local log = require('config').log
local i = require('nvim-web-devicons').get_icon('1.ts', 'ts')
local Path = require 'plenary.path'

function log(pre, args)
  print(pre .. vim.inspect(args))
end

-- vim.keymap.set('n', '<C-/>', function()
--   print 'hello'
-- end)
--
-- vim.keymap.set('n', '<C-.>', function()
--   print 'hello'
-- end)

-- vim.ui.select({'a',"b"}, function(input)
--   print(input)
-- end)
--
--
-- vim.ui.select({ 'tabs', 'spaces' }, {
--   prompt = 'Select tabs or spaces:',
--   format_item = function(item)
--     return "I'd like to choose " .. item
--   end,
-- }, function(choice)
--   print(choice)
-- end)

-- vim.ui.open 'https://neovim.io/'
-- vim.ui.open '~/.config/nvim/README.md'
--A
--
--
-- print(vim.tbl_contains({ 'a' }, 'a'))

local log = require('config').log
local i = require('nvim-web-devicons').get_icon('1.ts', 'ts')
local Path = require 'plenary.path'
local Job = require 'plenary.job'

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
--

-- cspell lint stdin:///Users/wx/.config/nvim/README.md --language-id markdown --no-color
-- local line = './lua/lua-playground.lua:2:29 - Unknown word (devicons)'

local name_space = vim.api.nvim_create_namespace 'playground'
local current_buf = vim.api.nvim_get_current_buf()

local bufname = vim.fn.expand '%:p'

local buf_content = vim.api.nvim_buf_get_lines(current_buf, 0, -1, false)
buf_content = vim.fn.join(buf_content, '\n')

local diagnostics = {}

local function handle_cspell_stdout(line)
  local row, col, message, word = string.match(line, [[.*:(%d+):(%d+)%s*-%s*(.*%((.*)%))]])
  table.insert(diagnostics, {
    col = col - 1,
    lnum = row - 1,
    end_col = col - 1 + string.len(word),
    end_lnum = row - 1,
    message = message,
  })
end
Job:new({
  command = 'cspell',
  args = {
    'lint',
    '--language-id',
    -- vim.bo.ft,
    vim.bo.ft,
    '--no-color',
    'stdin://' .. bufname,
  },
  writer = buf_content,
  on_stdout = function(error, data)
    handle_cspell_stdout(data)
  end,
  on_exit = function(self, code, signal)
    print('hellp', vim.inspect(diagnostics))
    vim.schedule(function()
      vim.diagnostic.set(name_space, current_buf, diagnostics)
    end)
  end,
}):start()

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

local function split(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '(%a+),?%s*') do
    table.insert(t, str)
  end
  return t
end

local function handle_cspell_stdout(line)
  -- ./README.md:108:29 - Unknown word (lnum) Suggestions: [linum, enum, unum, Unum, num]
  local row, col, message, word, suggestions = string.match(line, '.*:(%d+):(%d+)%s*-%s*(.*%((.*)%))%s*Suggestions:%s*%[(.*)%]')
  suggestions = split(suggestions, ',')

  print('suggestions', vim.inspect(suggestions))
  table.insert(diagnostics, {
    col = col - 1,
    lnum = row - 1,
    end_col = col - 1 + string.len(word),
    end_lnum = row - 1,
    message = message,
    user_data = {
      suggestions = suggestions,
    },
  })
end

local function run_cspell()
  Job:new({
    command = 'cspell',
    args = {
      'lint',
      '--language-id',
      -- vim.bo.ft,
      vim.bo.ft,
      '--no-color',
      '--show-suggestions',
      'stdin://' .. bufname,
    },
    writer = buf_content,
    on_stdout = function(error, data)
      handle_cspell_stdout(data)
    end,
    on_stderr = function()
      vim.schedule(function()
        vim.diagnostic.set(name_space, current_buf, diagnostics)
      end)
    end,
  }):start()
end

local function get_diagnostic_at_cursor()
  local cur_buf = vim.api.nvim_get_current_buf()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local entrys = vim.diagnostic.get(cur_buf, { namespace = name_space, lnum = line - 1 })
  print(vim.inspect(entrys))
  local v = entrys[1]
  print(v)
  if v == nil then
    return
  end
  local word = string.match(v.message, [[.*%((%a*)%)]])
  print(word)
  print(vim.inspect(v.user_data.suggestions))

  vim.schedule(function()
    vim.ui.select(v.user_data.suggestions, {
      prompt = 'Change spelling',
    }, function(choice)
      if choice ~= nil then
        vim.api.nvim_buf_set_text(current_buf, v.lnum, v.col, v.end_lnum, v.end_col, { choice })
      end
    end)
  end)
end
-- get_diagnostic_at_cursor()

-- vim.lsp.buf.code_action {
--   context = {
--     diagnostics = get_diagnostic_at_cursor(),
--   },
-- }
-- local suggestions_word = {}
-- Job:new({
--   command = 'cspell',
--   args = {
--     'suggestions',
--     '--stdin',
--     '--no-color',
--    u
--   },
--   writer = word,
--   on_stdout = function(error, data)
--     local word = string.match(data, [[%s-%s(%a+)]])
--     if word ~= nil then
--       table.insert(suggestions_word, word)
--     end
--   end,
--   on_exit = function(self, code, signal)
--     vim.schedule(function()
--       vim.ui.select(suggestions_word, {
--         prompt = 'Change spelling',
--       }, function(choice)
--         if choice ~= nil then
--           print(vim.inspect(diagnostic))
--           vim.api.nvim_buf_set_text(current_buf, diagnostic.lnum, diagnostic.col, diagnostic.end_lnum, diagnostic.end_col, { choice })
--         end
--       end)
--     end)
--   end,
-- }):start()
-- --
-- --
-- --
--
-- print(vim.inspect(string.match(' - hello', [[%s-%s(%a+)]])))
--
-- 1. 获取buf的文案错误
-- 2. 通过select 选取文案
-- 3. 移动光标到拼写错误的地方  e
--
--

-- vim.api.nvim_buf_attach(0, false, {
--   on_lines = function(...)
--     print(...)
--   end,
-- })

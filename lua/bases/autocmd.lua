local group = vim.api.nvim_create_augroup('biubiu', { clear = true })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 提示是录制模式
-- vim.api.nvim_create_autocmd('RecordingEnter', {
--   desc = 'Notify RecordingEnter',
--   group = group,
--   callback = function(ctx)
--     local msg = 'Recording macro started\n' .. 'id [' .. vim.fn.reg_recording() .. ']\n' .. 'buffer [' .. ctx.buf .. ']\n' .. 'file [' .. ctx.file .. ']'
--     vim.notify(msg)
--   end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  callback = function(event)
    vim.opt_local.spell = true
  end,
})

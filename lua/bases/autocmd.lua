-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 提示是录制模式
vim.api.nvim_create_autocmd('RecordingEnter', {
  desc = 'Notify RecordingEnter',
  group = vim.api.nvim_create_augroup('NotifyNotifyMacroRecordStarted', {}),
  callback = function(ctx)
    local msg = 'Recording macro started\n' .. 'id [' .. vim.fn.reg_recording() .. ']\n' .. 'buffer [' .. ctx.buf .. ']\n' .. 'file [' .. ctx.file .. ']'
    vim.notify(msg)
  end,
})

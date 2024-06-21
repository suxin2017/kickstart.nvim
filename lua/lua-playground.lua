local log = require('config').log
local i = require('nvim-web-devicons').get_icon('1.ts', 'ts')

local key = vim.api.nvim_get_keymap()

log(key)

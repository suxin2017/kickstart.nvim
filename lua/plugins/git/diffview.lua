return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = function()
    function DiffviewToggle()
      local lib = require 'diffview.lib'
      local view = lib.get_current_view()
      if view then
        -- Current tabpage is a Diffview; close it
        vim.cmd ':DiffviewClose'
      else
        -- No open Diffview exists: open a new one
        vim.cmd ':DiffviewOpen'
      end
    end
    return {
      { '<leader>gd', mode = { 'n' }, DiffviewToggle, desc = 'git diff' },
    }
  end,
}

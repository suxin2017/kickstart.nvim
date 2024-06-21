return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = function()
    local current_mode = 'stash'
    function DiffviewToggle(mode)
      local lib = require 'diffview.lib'
      local view = lib.get_current_view()

      local open_cmd = ':DiffviewOpen'
      if mode == 'master' then
        open_cmd = open_cmd .. ' origin/master..HEAD'
      end
      if mode == current_mode then
        if view then
          -- Current tabpage is a Diffview; close it
          vim.cmd ':DiffviewClose'
        else
          -- No open Diffview exists: open a new one
          vim.cmd(open_cmd)
        end
      else
        if view then
          -- Current tabpage is a Diffview; close it
          vim.cmd ':DiffviewClose'
          vim.cmd(open_cmd)
        else
          -- No open Diffview exists: open a new one
          vim.cmd(open_cmd)
        end
      end
      current_mode = mode
    end
    return {
      {
        '<leader>gds',
        mode = { 'n' },
        function()
          DiffviewToggle 'stash'
        end,
        desc = 'Git diff worktree',
      },
      {
        '<leader>gdm',
        mode = { 'n' },
        function()
          DiffviewToggle 'master'
        end,
        desc = 'Git diff remote mastere',
      },
    }
  end,
}

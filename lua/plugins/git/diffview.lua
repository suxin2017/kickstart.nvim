return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  opt = {},
  config = function()
    local current_mode = 'stash'
    function DiffviewToggle(mode)
      local lib = require 'diffview.lib'
      local view = lib.get_current_view()

      local open_cmd = 'DiffviewOpen'
      if mode == 'master' then
        open_cmd = open_cmd .. ' origin/master..HEAD'
      end
      print(current_mode, mode, not not view)
      if mode == current_mode then
        if view then
          -- Current tabpage is a Diffview; close it
          vim.cmd 'tabc'
        else
          -- No open Diffview exists: open a new one
          vim.cmd(open_cmd)
        end
      else
        if view then
          -- Current tabpage is a Diffview; close it
          vim.cmd('tabc | ' .. open_cmd)
        else
          -- No open Diffview exists: open a new one
          vim.cmd(open_cmd)
        end
      end
      current_mode = mode
    end
    vim.keymap.set('n', '<leader>gds', function()
      DiffviewToggle 'stash'
    end, { desc = 'Git diff worktree' })

    vim.keymap.set('n', '<leader>gdm', function()
      DiffviewToggle 'master'
    end, { desc = 'Git diff remote master' })
  end,
}

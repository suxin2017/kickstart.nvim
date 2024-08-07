return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>r', group = 'Rename' },
      { '<leader>r', group = 'Search' },
      { '<leader>f', group = 'Find' },
      { '<leader>w', group = 'Window' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>g', group = 'Git / Goto' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>u', group = 'Ui' },
    }
  end,
}

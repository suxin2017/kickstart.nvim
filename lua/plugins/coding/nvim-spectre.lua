return {
  'nvim-pack/nvim-spectre',
  keys = {
    {
      '<leader>S',
      function()
        require('spectre').toggle()
      end,
      mode = { 'n' },
      desc = 'Toggle Spectre',
    },
  },
}

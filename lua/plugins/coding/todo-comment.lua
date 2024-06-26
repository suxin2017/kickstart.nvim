-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  keys = {
    { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Search TODOS' },
  },
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}

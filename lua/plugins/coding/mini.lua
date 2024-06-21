return {
  {
    'echasnovski/mini.ai',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    event = 'VeryLazy',
    version = '*',
    opts = function()
      local gen_spec = require('mini.ai').gen_spec
      return {
        custom_textobjects = {
          F = gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        },
      }
    end,
  },
  { 'echasnovski/mini.surround', event = 'VeryLazy', version = '*' },
}

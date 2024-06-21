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
          t = gen_spec.treesitter { a = '@jsx.outer', i = '@jsx.inner' },
        },
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        surrounds = {
          ['t'] = false,
        }, -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}

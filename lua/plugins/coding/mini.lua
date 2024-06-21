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
          e = function()
            local current_buffer = vim.api.nvim_get_current_buf()
            local line_count = vim.api.nvim_buf_line_count(current_buffer)

            return {
              from = { line = 1, col = 1 },
              to = {
                line = line_count,
                col = 1,
              },
              vis_mode = 'V',
            }
          end,
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

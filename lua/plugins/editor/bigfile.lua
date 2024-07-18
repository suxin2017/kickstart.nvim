return {
  'pteroctopus/faster.nvim',
  event = 'VeryLazy',
  enabled = false,
  opts = {
    behaviours = {
      bigfile = {
        extra_patterns = {
          { filesize = 0, pattern = '*-lock.json,*-locl.yaml' },
        },
      },
      fastmacro = {
        on = false,
      },
    },
  },
}

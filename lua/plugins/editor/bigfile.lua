return {
  'pteroctopus/faster.nvim',
  event = 'VeryLazy',
  opts = {
    behaviours = {
      bigfile = {
        extra_patterns = {
          { filesize = 0, pattern = '*-lock.json,*-locl.yaml' },
        },
      },
    },
  },
}

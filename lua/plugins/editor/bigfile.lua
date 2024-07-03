return {
  'pteroctopus/faster.nvim',
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

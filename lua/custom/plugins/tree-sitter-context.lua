return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require('nvim-treesitter.configs').setup {
      context = {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
      },
    }
  end,
  requires = 'nvim-treesitter/nvim-treesitter',
}

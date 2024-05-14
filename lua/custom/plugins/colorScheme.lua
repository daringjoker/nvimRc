return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function() end,
    priority = 1000,
  },
  {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup {
        mirage = false,
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
  },
}

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'rouge8/neotest-rust',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-rust' {
            args = { '--all-features' },
          },
        },
      }
      vim.keymap.set('n', '<leader>l', require('neotest').run.run, { desc = 'Run test' })
    end,
  },
}

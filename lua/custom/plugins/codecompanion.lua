return {

  {
    'olimorris/codecompanion.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
        stragies = {
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'anthropic',
          },
        },
      }
    end,
    keys = {
      { '<leader>ka', '<cmd>CodeCompanion<cr>', desc = 'Code Companion' },
      { '<leader>ks', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Code Companion Chat' },
      { '<leader>kl', '<cmd>CodeCompanionInline<cr>', desc = 'Code Companion Inline' },
    },
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    opts = {
      preview = {
        filetypes = { 'markdown', 'codecompanion' },
        ignore_buftypes = {},
      },
    },
  },
  {
    'echasnovski/mini.diff',
    config = function()
      local diff = require 'mini.diff'
      diff.setup {
        -- Disabled by default
        source = diff.gen_source.none(),
      }
    end,
  },
}

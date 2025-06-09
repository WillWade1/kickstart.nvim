return {

  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'j-hui/fidget.nvim', -- Display status
      'ravitemer/codecompanion-history.nvim',
      {
        'HakonHarnes/img-clip.nvim', -- Share images with the chat buffer
        event = 'VeryLazy',
        cmd = 'PasteImage',
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = '[Image]($FILE_PATH)',
              use_absolute_path = true,
            },
          },
        },
      },
    },
    opts = {
      extensions = {},
      adapters = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = os.getenv 'ANTHROPIC_API_KEY',
            },
          })
        end,
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            env = {
              api_key = os.getenv 'GEMINI_API_KEY',
            },
          })
        end,
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            opts = {
              stream = true,
            },
            env = {
              api_key = os.getenv 'OPENAI_API_KEY',
            },
            schema = {
              model = {
                default = function()
                  return 'gpt-4.1'
                end,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = {
            name = 'copilot',
            model = 'gpt-4.1',
          },
        },
        inline = {
          adapter = {
            name = 'copilot',
            model = 'gpt-4.1',
          },
        },
      },
    },
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

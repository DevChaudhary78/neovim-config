return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>st', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = 'Toggle Spectre',
      })
      vim.keymap.set('n', '<leader>sn', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = 'Search current word',
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = 'Search on current file',
      })
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function()
      require('oil').setup {
        columns = {
          'icon',
        },
        view_options = {
          show_hidden = true,
        },
        default_file_explorer = true,
      }
      vim.keymap.set('n', '<C-n>', '<CMD>Oil<CR>', { noremap = true, silent = true })
    end,
  },
}

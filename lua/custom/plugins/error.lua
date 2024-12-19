return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      {
        icons = false,
        fold_open = 'v', -- icon used for open folds
        fold_closed = '>', -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- Only define the error sign
          error = 'E',
        },
        use_diagnostic_signs = true, -- Use the signs defined in your lsp client
      },
    },
    config = function()
      -- Your keymaps remain unchanged
      vim.keymap.set('n', '<leader>xx', function()
        require('trouble').toggle()
      end)
      vim.keymap.set('n', '<leader>xw', function()
        require('trouble').toggle 'workspace_diagnostics'
      end)
      vim.keymap.set('n', '<leader>xd', function()
        require('trouble').toggle 'document_diagnostics'
      end)
      vim.keymap.set('n', '<leader>xq', function()
        require('trouble').toggle 'quickfix'
      end)
      vim.keymap.set('n', '<leader>xl', function()
        require('trouble').toggle 'loclist'
      end)
      vim.keymap.set('n', 'gR', function()
        require('trouble').toggle 'lsp_references'
      end)

      -- Add this to hide warnings, hints, and info
      vim.diagnostic.config {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        signs = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        underline = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        float = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
      }
    end,
  },
}

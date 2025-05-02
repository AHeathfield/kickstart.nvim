-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function()
    local autopairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    -- Basic setup
    autopairs.setup {}

    -- Only add the rule for markdown files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        -- This adds * complete for italics and bold in markdown
        autopairs.add_rule(Rule('*', '*'):with_pair(function(opts)
          -- Get current cursor position
          local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
          local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

          -- Check if we're inside a code block
          local in_code_block = false
          for i = 1, cursor_line do
            local line = buf_lines[i]
            if line:match '^```' then
              in_code_block = not in_code_block -- Toggle state
            end
          end

          -- Disable autopair if inside code block
          return not in_code_block
        end))

        -- This adds == complete for markdown highlighting
        autopairs.add_rule(Rule('==', '=='):with_pair(function(opts)
          -- Get current cursor position
          local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
          local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

          -- Check if we're inside a code block
          local in_code_block = false
          for i = 1, cursor_line do
            local line = buf_lines[i]
            if line:match '^```' then
              in_code_block = not in_code_block -- Toggle state
            end
          end

          -- Disable autopair if inside code block
          return not in_code_block
        end))
      end,
    })
  end,
}

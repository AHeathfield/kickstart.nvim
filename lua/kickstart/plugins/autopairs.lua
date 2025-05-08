-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    -- Setup autopairs
    npairs.setup {}

    -- Function to check if the cursor is inside a Markdown code block
    local function in_markdown_code_block()
      if vim.bo.filetype ~= 'markdown' then
        return false
      end
      local line_num = vim.fn.line '.' - 1
      local lines = vim.api.nvim_buf_get_lines(0, 0, line_num, false)

      local count = 0
      for _, line in ipairs(lines) do
        if line:match '^```' then
          count = count + 1
        end
      end

      return count % 2 == 1 -- Inside block if odd number of ```
    end

    npairs.add_rules {
      Rule('*', '*', 'markdown'):with_pair(function()
        return not in_markdown_code_block()
      end),
      Rule('==', '==', 'markdown'):with_pair(function()
        return not in_markdown_code_block()
      end),
    }
  end,
}

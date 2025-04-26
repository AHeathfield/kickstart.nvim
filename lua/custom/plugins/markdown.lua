return {
  {
    -- This is for neovim markdown rendering in NORMAL MODE
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- NOTE: I don't think I need this, seems a little overkill
  -- {
  --   -- This is for opening a preview window to the side using :MarkdownPreview and :MarkdownPreviewStop
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   ft = { 'markdown' },
  --   build = function()
  --     vim.fn['mkdp#util#install']()
  --   end,
  --   config = function()
  --     -- Keybindings for the commands
  --     vim.keymap.set('n', '<leader>md', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview Window' })
  --   end,
  -- },
}

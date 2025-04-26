-- NOTE: In lazy_kickstart, that's where the Mason config is, you need to add the debugger to the list
return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'vadimcn/codelldb',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      -- Where we add the requirements
      -- require('codelldb').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- For C++
      dap.adapters.codelldb = {
        type = 'executable',
        command = '/home/aah/.local/share/nvim/mason/bin/codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"

        -- On windows you may have to uncomment this:
        -- detached = false,
      }
      dap.configurations.cpp = {
        {
          name = 'Launch file',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Set debugger break point' })

      -- Eval var under cursor
      vim.keymap.set('n', '<space>?', function()
        dapui.eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debugger Continue' })
      vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debugger Step Into' })
      vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debugger Step Over' })
      vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debugger Step Out' })
      vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debugger Step Back' })
      vim.keymap.set('n', '<F6>', dap.restart, { desc = 'Debugger Restart' })
    end,
  },
}

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      local map = function(lhs, rhs, desc)
        if desc then
          desc = desc .. " [dap]"
        end

        vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
      end

      map("<leader>db", require("dap").toggle_breakpoint, "toggle_breakpoint")
      map("<leader>dB", function()
        require("dap").set_breakpoint(vim.fn.input("[DAP] Condition > "))
      end, "toggle_breakpoint with condition")
      map("<leader>ds", dap.close, "stop")
      map("<leader>dc", dap.continue, "continue")
      map("<F12>", dap.continue, "continue")
      map("<F5>", dap.step_out, "step_out")
      map("<F11>", dap.step_into, "step_into")
      map("<F10>", dap.step_over, "step_over")
      map("<F9>", dap.step_back, "step_back")
      map("<leader>dC", dap.clear_breakpoints, "clear_breakpoints")

      -- DAP UI
      map("<leader>dt", "<cmd>DapUiToggle<cr>", "toggle debug ui")
      map("<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", "reset ui")

      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { ctermbg = 0, fg = "#8b5cf6", bg = "" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { ctermbg = 0, fg = "#993939", bg = "" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#01B000", bg = "" })

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })

      -- TODO: Look into this
      dap.configurations.go = {}

      -- NOTE: See DAP logs with :DapShowLog
      dap.set_log_level("INFO") -- Helps when configuring DAP, see logs with :DapShowLog
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup({})
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui" },
    config = function()
      require("dap-go").setup()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        -- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
        enabled_commands = false,

        -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_changed_variables = true,
        highlight_new_as_changed = true,

        -- prefix virtual text with comment string
        commented = false,

        show_stop_reason = true,

        -- experimental features:
        virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      })

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}

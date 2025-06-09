return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "[D]ap Toggle [b]reackpoints",
    },
{
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      desc = "[D]ap set conditional [B]reackpoints",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "[D]ap [c]ontinue",
    },    {
      "<leader>dr",
      function()
        require("dap").restart()
      end,
      desc = "[D]ap [r]restart",
    },
    {
      "<leader>dso",
      function()
        require("dap").step_out()
      end,
      desc = "[D]ap [s]tep [o]ut",
    },
    {
      "<leader>dsi",
      function()
        require("dap").step_into()
      end,
      desc = "[D]ap [s]tep [i]nto",
    },
    {
      "<leader>dn",
      function()
        require("dap").step_over()
      end,
      desc = "[D]ap [n]ext",
    },
    {
      "<leader>duk",
      function()
        require("dapui").close()
      end,
      desc = "[D]ap [u]i [k]ill",
    },
{
      "<leader>dut",
      function()
        require("dapui").toggle()
      end,
      desc = "[D]ap [u]i [t]oogle",
    },
    {
      "<leader>dur",
      function()
        require("dapui").open({reset= true})
      end,
      desc = "[D]ap [u]i [r]efresh",
    },

  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    dap_virtual_text.setup({})
    dapui.setup({})

    require ('mason-nvim-dap').setup({
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      }
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    -- dap.listeners.before.event_terminated.dapui_config = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   dapui.close()
    -- end
  end
}

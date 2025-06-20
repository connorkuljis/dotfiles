local dap = {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		},
		lazy = true,
		enabled = true,
		keys = {
			{
				"<leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "Toggle Breakpoint"
			},
			{
				"<leader>dl",
				function() require("dap").run_to_cursor() end,
				desc = "Run to Cursor"
			},
			{
				"<leader>dd",
				function() require("dap").continue() end,
				desc = "Continue"
			},
			{
				"<leader>dn",
				function() require("dap").step_over() end,
				desc = "Next Step"
			},
			{
				"<leader>dN",
				function() require("dap").step_into() end,
				desc = "Next Step"
			},
		},
		config = function()
			-- register dap adapters
			require("dap-go").setup()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
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
		end,
	},
	{
		"leoluz/nvim-dap-go",
		keys = {
			{
				"<leader>dt",
				function() require("dap-go").debug_test() end,
				desc = "Debug Test"
			},
			{
				"<leader>dT",
				function() require("dap-go").debug_last_test() end,
				desc = "Debug Last Test"
			},
		},
	},
}

return dap

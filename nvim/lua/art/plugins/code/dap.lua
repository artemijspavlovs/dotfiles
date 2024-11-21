return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_go = require("dap-go")

			-- Setup DAP UI
			dapui.setup()

			-- Automatically open/close DAP UI when debugging starts or ends
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Setup Go debugger (Delve)
			dap_go.setup()

			-- Key mappings for debugging actions
			vim.keymap.set("n", "<leader>d", "", { desc = "DAP Shortcuts" })
			vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "Continue" })
			vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Toggle DAP UI" })
		end,
	},
}

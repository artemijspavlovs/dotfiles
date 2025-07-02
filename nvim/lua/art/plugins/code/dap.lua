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

			-- Setup virtual text
			require("nvim-dap-virtual-text").setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
				show_stop_reason = true,
				commented = false,
				virt_text_pos = "eol",
				all_frames = true,
				virt_lines = false,
				virt_text_win_col = nil,
			})

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
			vim.keymap.set("n", "<leader>ds", require("dap").step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<leader>di", require("dap").step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<leader>do", require("dap").step_out, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>dr", require("dap").restart, { desc = "Restart" })
			vim.keymap.set("n", "<leader>dq", require("dap").terminate, { desc = "Terminate" })
		end,
	},
}

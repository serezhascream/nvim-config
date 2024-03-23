return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-k>"] = actions.move_selection_previous, -- move to previous result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
	end,
	keys = {
		-- search
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files within current working directory" },
		{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Find string in current working directory as you type" },
		{ "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Find string under cursor in current directory" },
		-- buffers and help
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List open buffers in current neovim instance" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "List available help tags" },
		-- git
		{ "<leader>gc", "<cmd>Telescope git commits<CR>", desc = "List all commits" },
		{ "<leader>gfc", "<cmd>Telescope git_bcommits<CR>", desc = "List git commits for current file/buffer" },
		{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "List git branches" },
		{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "List current changes per file with diff preview" },
	},
}

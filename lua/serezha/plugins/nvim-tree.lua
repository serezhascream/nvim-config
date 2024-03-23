return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvimtree = require("nvim-tree")
		local treeutils = require("serezha.treeutils")

		-- recomended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#2F3B40 ]])
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeFolderIcon guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeFolderName guifg=#a6adc8 ]])
		vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeOpenedFile guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeOpenedHL guifg=#74c7ec ]])
		vim.cmd([[ highlight NvimTreeGitNewIcon guifg=#f9e2af ]])
		vim.cmd([[ highlight NvimTreeGitStagedIcon guifg=#a6e3a1 ]])
		vim.cmd([[ highlight NvimTreeGitDirtyIcon guifg=#94e2d5 ]])

		vim.keymap.set("n", "<leader>?", treeutils.launch_find_files, { desc = "Launch Find Files" })
		vim.keymap.set("n", "<leader>/", treeutils.launch_live_grep, { desc = "Launch Live Grep" })

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				local buf_is_nvim = vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree"
				local window_number = vim.fn.winnr("$")
				if buf_is_nvim then
					print("buf_isNvim", buf_is_nvim, "window_number", window_number)
				end
			end,
		})

		--configure nvim-tree
		nvimtree.setup({
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			hijack_cursor = true,
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
						git = {
							unstaged = "",
							staged = "󰸞",
							untracked = "󰓒",
						},
					},
				},
			},

			-- disable window-picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Nvim-Tree explorer" },
	},
}

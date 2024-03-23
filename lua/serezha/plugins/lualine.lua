return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local custom_nord = require("lualine.themes.nord")

		-- custom colors
		custom_nord.normal.a.bg = "#4FD1AA"
		custom_nord.normal.b.bg = "#21292D"
		custom_nord.normal.c.bg = "#191F22"
		custom_nord.inactive.a.bg = "#1D2327"
		custom_nord.inactive.a.fg = "#4FD1AA"
		custom_nord.inactive.b.bg = "#21292D"
		custom_nord.inactive.c.bg = "#21292D"

		lualine.setup({
			options = {
				theme = "catppuccin",
				section_separators = "",
				component_separators = { left = "·", right = "·" },
				globalstatus = true,
				filetype_names = {
					NvimTree = "NvimTree",
				},
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						show_modified_status = true,
						use_mode_colors = true,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "tabs" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"filetype",
						colored = true, -- Displays filetype icon in color if set to true
						icon_only = true, -- Display only an icon for filetype
						icon = { align = "center" }, -- Display filetype icon on the right hand side
					},
					"filename",
				},
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = { {
					"datetime",
					style = "%H:%M",
				} },
			},
		})
	end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local custom_nord = require("lualine.themes.nord")

    -- custom colors
    custom_nord.normal.b.bg = "#21292D"
    custom_nord.normal.c.bg = "#191F22"
    custom_nord.inactive.b.bg = "#21292D"
    custom_nord.inactive.c.bg = "#21292D"

    lualine.setup({
      options = {
        theme = custom_nord,
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

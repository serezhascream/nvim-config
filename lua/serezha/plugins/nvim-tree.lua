return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recomended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#2F3B40 ]])
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#8FBCBB ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#8FBCBB ]])

    --configure nvim-tree
    nvimtree.setup({
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼",
            },
          },
        },
      },

      -- disable window-picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
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

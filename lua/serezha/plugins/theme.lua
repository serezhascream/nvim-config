return {
  "shaunsingh/nord.nvim",
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true,
    vim.cmd([[ colorscheme nord ]])

    -- color customizations
    vim.cmd([[ hi Normal guibg=#191F22 ]])
    vim.cmd([[ hi SignColumn guibg=#191F22 ]])
    vim.cmd([[ hi CursorLine guibg=#21292D ]])
  end,
}

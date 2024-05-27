return {
  "BernhardRode/gruvbox.nvim",
  name = "gruvbox-material",
  priority = 1000,
  lazy = false,
  config = true,
  opts = {
    background = {
      transparent = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

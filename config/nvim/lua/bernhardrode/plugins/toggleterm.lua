return {
  "akinsho/toggleterm.nvim",

  -- keys = {
  --   { "<leader>c", "<cmd>ToggleTerm direction=float dir=${vim.loop.dir}<cr>", desc = "ToggleTerm open" },
  -- },
  config = function()
    require("toggleterm").setup({
      autochdir = true,
      direction = "float",
      insert_mappings = true,
      open_mapping = [[<c-t>]],
      terminal_mappings = true,
    })
  end,
}

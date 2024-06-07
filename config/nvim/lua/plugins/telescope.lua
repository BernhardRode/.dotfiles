return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    -- {"<leader>/", false},
    -- change a keymap
    { "<leader><leader>", "<Cmd>Telescope find_files<CR>", desc = "[F]iles" },
    { "<leader>fr", "<Cmd>Telescope resume<CR>", desc = "[R]esume" },
    { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "[F]ind" },
    { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "[G]rep" },
    { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "[B]uffers" },
    -- add a keymap to browse plugin files
    -- {
    --   "<leader>fp",
    --   function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
    --   desc = "Find Plugin File",
    -- },
  },
}

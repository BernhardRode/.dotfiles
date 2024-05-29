return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-media-files.nvim",
    "folke/todo-comments.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader><leader>", "<Cmd>Telescope find_files<CR>" },
    { "<leader>fr", "<Cmd>Telescope resume<CR>" },
    { "<leader>ff", "<Cmd>Telescope find_files<CR>" },
    { "<leader>fg", "<Cmd>Telescope live_grep<CR>" },
    { "<leader>fb", "<Cmd>Telescope buffers<CR>" },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      -- override_file_sorter = true, -- override the file sorter
      -- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      -- filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        layout_config = {
          -- prompt_position = "center",
          -- preview_width = 0.6,
        },
        sorting_strategy = "ascending",
      },
      pickers = {
        find_files = {
          hidden = false,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
        grep_string = {
          additional_args = function()
            return { "--hidden", "--glob", "!**/.git/*" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}

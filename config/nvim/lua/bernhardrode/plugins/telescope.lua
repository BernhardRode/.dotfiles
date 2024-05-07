return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    -- "folke/todo-comments.nvim",
  },
  cmd = "Telescope",
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
    },
    { "<leader>sr", "<Cmd>Telescope resume<CR>" },
    { "<leader>sf", "<Cmd>Telescope find_files<CR>" },
    { "<leader>ss", "<Cmd>Telescope live_grep<CR>" },
    { "<leader>st", "<Cmd>Telescope grep_string<CR>" },
    { "<leader>sh", "<Cmd>Telescope help_tags<CR>" },
    { "<leader>km", "<Cmd>Telescope keymaps<CR>" },
    { "<leader>di", "<Cmd>Telescope diagnostics<CR>" },

    {
      "<leader>sa",
      function()
        local git_root = vim.fn.system("git rev-parse --show-toplevel | tr -d '\n'")
        require("telescope.builtin").find_files({ cwd = git_root, no_ignore = true })
      end,
    },

    {
      "<leader>sg",
      function()
        require("telescope.builtin").git_files({ show_untracked = true })
      end,
    },

    {
      "<leader>ls",
      function()
        require("telescope.builtin").buffers({ sort_lastused = true })
      end,
    },

    {
      "<leader>sn",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config"), no_ignore = true })
      end,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      -- override_file_sorter = true, -- override the file sorter
      -- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
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

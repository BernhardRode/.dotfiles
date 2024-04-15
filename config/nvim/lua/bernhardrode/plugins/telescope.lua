return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
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
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[f]ind [r]ecent files" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[f]ind [f]iles in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[f]ind [s]string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "[f]ind [s]tring under cursor in cwd" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[f]ind [h]elp" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope diagnostics<cr>", { desc = "[f]ind [d]iagnostics" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[f]ind [t]odos" })
  end,
}

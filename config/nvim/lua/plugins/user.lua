-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " ",
        "███████╗ ██████╗  ██████╗   ██████╗        ██████╗  ███████╗ ██╗   ██╗",
        "██╔════╝ ██╔══██╗ ██╔══██╗ ██╔═══██╗       ██╔══██╗ ██╔════╝ ██║   ██║",
        "█████╗   ██████╔╝ ██████╔╝ ██║   ██║       ██║  ██║ █████╗   ██║   ██║",
        "██╔══╝   ██╔══██╗ ██╔══██╗ ██║   ██║       ██║  ██║ ██╔══╝   ╚██╗ ██╔╝",
        "███████╗ ██████╔╝ ██████╔╝ ╚██████╔╝  ██╗  ██████╔╝ ███████╗  ╚████╔╝",
        "╚══════╝ ╚═════╝  ╚═════╝   ╚═════╝   ╚═╝  ╚═════╝  ╚══════╝   ╚═══╝",
        "                                                      ...let's go to work!!!",
        " ",
      }
      return opts
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      -- require("telescope").load_extension("media_files")
    end,
  },
  { "github/copilot.vim" },
}

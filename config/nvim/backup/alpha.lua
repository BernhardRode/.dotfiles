return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    local alpha = require("alpha")
    local fortune = require("alpha.fortune")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[ ]],
      [[███████╗ ██████╗  ██████╗   ██████╗        ██████╗  ███████╗ ██╗   ██╗]],
      [[██╔════╝ ██╔══██╗ ██╔══██╗ ██╔═══██╗       ██╔══██╗ ██╔════╝ ██║   ██║]],
      [[█████╗   ██████╔╝ ██████╔╝ ██║   ██║       ██║  ██║ █████╗   ██║   ██║]],
      [[██╔══╝   ██╔══██╗ ██╔══██╗ ██║   ██║       ██║  ██║ ██╔══╝   ╚██╗ ██╔╝]],
      [[███████╗ ██████╔╝ ██████╔╝ ╚██████╔╝  ██╗  ██████╔╝ ███████╗  ╚████╔╝]],
      [[╚══════╝ ╚═════╝  ╚═════╝   ╚═════╝   ╚═╝  ╚═════╝  ╚══════╝   ╚═══╝]],
      [[                                                      ...let's go to work!!!]],
      [[ ]],
    }
    dashboard.section.footer.val = fortune()

    dashboard.config.opts.noautocmd = true

    vim.cmd([[autocmd User AlphaReady echo 'ready']])
    alpha.setup(dashboard.config)
    return opts
  end,
}

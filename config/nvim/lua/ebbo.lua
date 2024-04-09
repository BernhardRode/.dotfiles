-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- set background=dark
--
--
local config = {
  header = {
    " ",
    "███████╗ ██████╗  ██████╗   ██████╗        ██████╗  ███████╗ ██╗   ██╗",
    "██╔════╝ ██╔══██╗ ██╔══██╗ ██╔═══██╗       ██╔══██╗ ██╔════╝ ██║   ██║",
    "█████╗   ██████╔╝ ██████╔╝ ██║   ██║       ██║  ██║ █████╗   ██║   ██║",
    "██╔══╝   ██╔══██╗ ██╔══██╗ ██║   ██║       ██║  ██║ ██╔══╝   ╚██╗ ██╔╝",
    "███████╗ ██████╔╝ ██████╔╝ ╚██████╔╝  ██╗  ██████╔╝ ███████╗  ╚████╔╝",
    "╚══════╝ ╚═════╝  ╚═════╝   ╚═════╝   ╚═╝  ╚═════╝  ╚══════╝   ╚═══╝",
    "                                                      ...let's go to work!!!",
    " ",
  },
}

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


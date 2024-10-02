{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rbo2abt";
  home.homeDirectory = "/Users/rbo2abt";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [ 
    awscli
    azure-cli
    eza
    bazelisk
    curl
    docker
    docker-compose
    fzf
    gh
    gnupg
    htop
    iftop
    jq
    killall
    kubectl
    neofetch
    nodePackages.nodemon
    nodePackages.npm
    nodePackages.prettier
    nodejs
    ripgrep
    terraform
    tflint
    wget
    zip 
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  programs = {
    alacritty = {
      enable = true;

      settings = {
        live_config_reload = true;

        # Window.
        # dynamic_title = true;
        window.padding = {
          x = 0;
          y = 0;
        };
        # window.decorations = "buttonless";

        # Fonts.
        font = {
          size = 15.0; 
          offset.y = 2;
          normal = {
            family = "FiraCode Nerd Font";
            style = "Retina";
          };
          bold = {
            family = "FiraCode Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "FiraCode Nerd Font";
            style = "Italic";
          };
        };
        colors = {
          draw_bold_text_with_bright_colors = true;
          primary = {
            background = "#282828";
            foreground = "#ebdbb2";
          };
          normal = {
            black = "#282828";
            red = "#cc241d";
            green = "#98971a";
            yellow = "#d79921";
            blue = "#458588";
            magenta = "#b16286";
            cyan = "#689d6a";
            white = "#a89984";
          };
          bright = {
            black = "#928374";
            red = "#fb4934";
            green = "#b8bb26";
            yellow = "#fabd2f";
            blue = "#83a598";
            magenta = "#d3869b";
            cyan = "#8ec07c";
            white = "#ebdbb2";
          };
        };
      };
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      # histSize = 10000;
      syntaxHighlighting.enable = true;
      # setOptions = [
      #   "autocd"
      #   "cdablevars"
      #   "histallowclobber"
      #   "histexpiredupsfirst"
      #   "histfcntllock"
      #   "histignorealldups"
      #   "histignoredups"
      #   "histignorespace"
      #   "histreduceblanks"
      #   "incappendhistory"
      #   "nomultios"
      #   "sharehistory"
      # ];
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza --group-directories-first";
        groot = "cd $(git rev-parse --show-toplevel)";
        k = "kubectl";
        # ks = "kubectl -n kube-system";
        # kube decode secrets (mind the space in the end to separate ' from '' :facepalm.nix:)
        # kds = ''kubectl get secrets -o go-template='{{range $k,$v := .data}}{{$k}}="{{($v | base64decode)}}"{{"\n"}}{{end}}' '';
        # kube get pods' images
        # kgpi = ''kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" | tr -s '[[:space:]]' '\n' | sort | uniq -c'';
        tf = "terraform";
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    go = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "bernhardrode";
      userEmail = "rbo2abt@bosch.com";
    };
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    nixvim = {
      enable = true;
      defaultEditor = true;

      globals = {
        mapleader = " ";
      };

      opts =  {
        updatetime = 50; # Faster completion

        number = true;
        relativenumber = true;

        autoindent = true;
        clipboard = "unnamed,unnamedplus";
        expandtab = true;
        shiftwidth = 2; 
        scrolloff = 10;
        softtabstop = 2;
        tabstop = 2;
        smartindent = true;
        breakindent = true;
        ignorecase = true;
        mouse = "a";
        wrap = false;
        swapfile = false;
        undofile = true;
      };
      colorschemes.gruvbox.enable = true;
      plugins = {
        auto-session.enable = true;
        cmp-zsh.enable = true;
        cmp.enable = true;
        comment.enable = true;
        multicursors.enable = true;
        neo-tree.enable = true;
        noice.enable = true;
        trouble.enable = true;
        web-devicons.enable = true;
        persistence.enable = true;

        treesitter-context = {
          enable = true;
          settings = {
            max_lines = 3;
          };
        };

        treesitter = {
          enable = true;
          settings = {
            max_lines = 3;
          };
        };

        alpha = {
          enable = true;
          layout = let
            padding = val: {
              type = "padding";
              inherit val;
            };
          in [
            (padding 4)
            {
              opts = {
                hl = "AlphaHeader";
                position = "center";
              };
              type = "text";
              val = [
                "  ███████╗ ██████╗  ██████╗   ██████╗        ██████╗  ███████╗ ██╗   ██╗"
                "  ██╔════╝ ██╔══██╗ ██╔══██╗ ██╔═══██╗       ██╔══██╗ ██╔════╝ ██║   ██║"
                "  █████╗   ██████╔╝ ██████╔╝ ██║   ██║       ██║  ██║ █████╗   ██║   ██║"
                "  ██╔══╝   ██╔══██╗ ██╔══██╗ ██║   ██║       ██║  ██║ ██╔══╝   ╚██╗ ██╔╝"
                "  ███████╗ ██████╔╝ ██████╔╝ ╚██████╔╝  ██╗  ██████╔╝ ███████╗  ╚████╔╝"
                "  ╚══════╝ ╚═════╝  ╚═════╝   ╚═════╝   ╚═╝  ╚═════╝  ╚══════╝   ╚═══╝"
                "                                                      ...let's go to work!!!"
              ];
            }
            (padding 2)
            {
              type = "button";
              val = "  Find File";
              on_press = {
                __raw = "function() require('telescope.builtin').find_files() end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "f"
                  ":Telescope find_files <CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "f";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            {
              type = "button";
              val = "  New File";
              on_press = {
                __raw = "function() vim.cmd[[ene]] end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "n"
                  ":ene <BAR> startinsert <CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "n";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            {
              type = "button";
              val = "󰈚  Recent Files";
              on_press = {
                __raw = "function() require('telescope.builtin').oldfiles() end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "r"
                  ":Telescope oldfiles <CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "r";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            {
              type = "button";
              val = "󰈭  Find Word";
              on_press = {
                __raw = "function() require('telescope.builtin').live_grep() end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "g"
                  ":Telescope live_grep <CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "g";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            {
              type = "button";
              val = "  Restore Session";
              on_press = {
                __raw = "function() require('persistence').load() end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "s"
                  ":lua require('persistence').load()<cr>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "s";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            (padding 1)
            {
              type = "button";
              val = "  Quit Neovim";
              on_press = {
                __raw = "function() vim.cmd[[qa]] end";
              };
              opts = {
                # hl = "comment";
                keymap = [
                  "n"
                  "q"
                  ":qa<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "q";

                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
        };

        lsp-format = {
          enable = true;
        };

        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            cssls.enable = true;
            docker-compose-language-service.enable = true;
            dockerls.enable = true;
            eslint.enable = true;
            gopls.enable = true;
            helm-ls.enable = true;
            html.enable = true;
            htmx.enable = true;
            jsonls.enable = true;
            lua-ls.enable = true;
            nil-ls.enable = true;
            nixd.enable = true;
            terraformls.enable = true;
            ts-ls.enable = true;
            yamlls.enable = true;
          };
        };
        # which-key = {
        #   enable = true;
        #   settings = {
        #     icons = {
        #       separator = "";
        #       group = "";
        #     };
        #     keyLabels = {
        #      "<leader>" = "SPC"; 
        #     };
        #     registrations = {
        #       "<leader>c" = "󰅙 Close Buffer";
        #       "<leader>t" = "󰙅 FileExplorer";
        #       "<leader>f" = " Telescope";
        #       "<leader>w" = " WhichKey?!";
        #       "<leader>ff" = " Find Files";
        #       "<leader>l" = " LSP";
        #       "<leader>lf" = "󰉡 Format Buffer";
        #     };
        #   };
        # };
        telescope = {
          enable = true;

          enabledExtensions = [ "ui-select" ];
          extensions.ui-select.enable = true;
          extensions.frecency.enable = false;
          extensions.fzf-native.enable = true;

          keymaps = {
            # Find files using Telescope command-line sugar.
            "<leader>ff" = "find_files";
            "<leader>fg" = "live_grep";
            # "<leader>fh" = "help_tags";
            # "<leader>fd" = "diagnostics";

            # FZF like bindings
            # "<C-p>" = "git_files";
            # "<C-f>" = "live_grep";
            # "<leader>p" = "oldfiles";
          };

          settings.defaults = {
            file_ignore_patterns = [
              "^.git/"
              "^.mypy_cache/"
              "^__pycache__/"
              "^node_modules/"
              "^output/"
              "^data/"
              "%.ipynb"
            ];
          };
        };
      };
      extraPlugins = with pkgs.vimPlugins; [
        plenary-nvim
      ];
    };
    zellij = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  home.file = {
  };


  xdg = {
    configFile = {
     "zellij/config.kdl" = {
       text = ''
         default_layout "compact"
         mouse_mode false
         pane_frames false
         copy_on_select true
         on_force_close "detach"
         simplified_ui false

         theme "gruvbox-dark"
         ui {
           pane_frames {
             hide_session_name true
             rounded_corners true
           }
         }
       '';
     };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    COLORTERM = "truecolor";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}


{
  inputs,
  pkgs,
  ...
}:
{

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      relativenumber = true;
      number = true;
      scrolloff = 8;

      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      smartindent = true;

      swapfile = false;
      backup = false;
      undofile = true;

      hlsearch = true;
      incsearch = true;

      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";
      cursorline = true;

      spell = true;
      spelllang = [ "en" ];

      wrap = false;

      termguicolors = true;
      background = "dark";

      backspace = "indent,eol,start";
    };

    colorschemes.onedark = {
      enable = false;
      settings = {
        style = "deep";
        transparent = false;
      };
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    plugins = {
      web-devicons.enable = true;
      lualine.enable = true;
      bufferline.enable = true;

      colorizer.enable = true;
      illuminate.enable = true;

      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          filesystem = {
            follow_current_file = {
              enabled = true;
              leave_dirs_open = true;
            };
          };
        };
      };

      telescope.enable = true;

      treesitter.enable = true;

      # harpoon = {
      #   enable = true;
      #   settings = {
      #     save_on_toggle = true;
      #   };
      # };

      gitsigns.enable = true;
      diffview.enable = true;

      vim-surround.enable = true;
      comment.enable = true;

      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true; # leverage Treesitter for smarter pairing
          enable_check_bracket_line = false;
          fast_wrap = {
            enable = true;
            chars = [
              "{"
              "["
              "("
              "\""
              "'"
              "`"
            ];
          };
        };
      };

      trouble.enable = true;
      todo-comments.enable = true;

      markdown-preview.enable = true;

      toggleterm.enable = true;
      tmux-navigator.enable = true;

      blink-cmp = {
        enable = true;
        settings = {
          appearance.nerd_font_variant = "mono";
          keymap.preset = "super-tab";

          completion = {
            documentation = {
              auto_show = false;
              auto_show_delay_ms = 500;
            };
          };

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
          };

          snippets.preset = "luasnip";
          fuzzy.implementation = "prefer_rust_with_warning";
          signature.enabled = true;
        };
      };

      luasnip.enable = true;
      friendly-snippets.enable = true;

      # lsp-signature.enable = true;

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
          pyright.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          clangd.enable = true;
          cmake.enable = true;
          emmet_language_server.enable = true;
          jdtls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
        };

        keymaps = {
          diagnostic = {
            "<leader>dl" = "open_float";
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            lua = [ "stylua" ];
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            css = [ "prettierd" ];
            html = [ "prettierd" ];
            markdown = [ "prettierd" ];
            sh = [ "shfmt" ];
            python = [ "black" ];
          };
          format_on_save = {
            lsp_fallback = true;
          };
        };
      };
    };
    keymaps = [
      {
        key = "<leader>ff";
        mode = [ "n" ];
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Search files by name";
      }
      {
        key = "<leader>fs";
        mode = [ "n" ];
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Search files by contents";
      }

      # File tree (Neo-tree)
      {
        key = "<leader>fd";
        mode = [ "n" ];
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "File browser toggle";
      }

      # Terminal
      {
        key = "<leader>t";
        mode = [ "n" ];
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }

      # Trouble
      {
        key = "<leader>dt";
        mode = [ "n" ];
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options.desc = "Toggle diagnostics list";
      }
      {
        key = "<leader>dd";
        mode = [ "n" ];
        action = "<cmd>Trouble todo toggle<cr>";
        options.desc = "Toggle todo list";
      }

      # Utilities
      {
        mode = [ "n" ];
        key = "<leader>nh";
        action = ":nohl<CR>";
        options.desc = "Clear highlighting";
      }
      {
        mode = [ "v" ];
        key = "<A-J>";
        action = ":m '>+1<cr>gv=gv";
        options.desc = "Move selection down";
      }
      {
        mode = [ "v" ];
        key = "<A-K>";
        action = ":m '<-2<cr>gv=gv";
        options.desc = "Move selection up";
      }
      {
        mode = [ "n" ];
        key = "<A-J>";
        action = ":m +1<cr>V=";
        options.desc = "Move line down";
      }
      {
        mode = [ "n" ];
        key = "<A-K>";
        action = ":m -2<cr>V=";
        options.desc = "Move line up";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Copy to global clipboard";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>p";
        action = "\"+p";
        options.desc = "Paste from global clipboard";
      }

      # # Harpoon
      # {
      #   mode = [ "n" ];
      #   key = "<leader>a";
      #   action = ":lua require('harpoon').list().add()";
      # }
      # {
      #   mode = [ "n" ];
      #   key = "<C-e>";
      #   action = " :lua require('harpoon.ui').toggle_quick_menu(require('harpoon').list())";
      # }
      # {
      #   mode = [ "n" ];
      #   key = "<C-h>";
      #   action = " :lua require('harpoon').list().select(1)";
      # }
      # {
      #   mode = [ "n" ];
      #   key = "<C-t>";
      #   action = " :lua require('harpoon').list().select(2)";
      # }
      # {
      #   mode = [ "n" ];
      #   key = "<C-n>";
      #   action = " :lua require('harpoon').list().select(3)";
      # }
      # {
      #   mode = [ "n" ];
      #   key = "<C-s>";
      #   action = " :lua require('harpoon').list().select(4)";
      # }
      #
    ];

    extraConfigLua = ''
      vim.diagnostic.config {
          severity_sort = true,
          float = { border = 'rounded', source = 'if_many' },
          -- underline = { severity = vim.diagnostic.severity.ERROR },
          underline = false,
          signs = {
              text = {
                  [vim.diagnostic.severity.ERROR] = '󰅚 ',
                  [vim.diagnostic.severity.WARN] = '󰀪 ',
                  [vim.diagnostic.severity.INFO] = '󰋽 ',
                  [vim.diagnostic.severity.HINT] = '󰌶 ',
              },
          },
          virtual_lines = {
              source = 'if_many',
              spacing = 2,
              format = function(diagnostic)
                  local diagnostic_message = {
                      [vim.diagnostic.severity.ERROR] = diagnostic.message,
                      [vim.diagnostic.severity.WARN] = diagnostic.message,
                      [vim.diagnostic.severity.INFO] = diagnostic.message,
                      [vim.diagnostic.severity.HINT] = diagnostic.message,
                  }
                  return diagnostic_message[diagnostic.severity]
              end,
          },
      }
    '';

  extraPackages = with pkgs; [
    prettierd
    shfmt
    black
  ];
}

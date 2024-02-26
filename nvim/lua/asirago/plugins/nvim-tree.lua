return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local map = function(mode, lhs, rhs, desc)
        if desc then
          desc = desc .. " [nvim-tree]"
        end

        vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, nowait = true, desc = desc, noremap = true })
      end

      -- api.config.mappings.default_on_attach(bufnr)
      map("n", "K", api.node.show_info_popup, "Info")
      map("n", "<BS>", api.node.navigate.parent_close, "Close Directory")
      map("n", "c", api.tree.change_root_to_node, "CD")
      map("n", "a", api.fs.create, "Create File or Directory")
      map("n", "d", api.fs.remove, "Detele")
      map("n", "r", api.fs.rename, "Rename")
      map("n", "q", api.tree.close, "Close Tree")
      map("n", "H", api.tree.toggle_hidden_filter, "Toggle: Dotfiles")
      map("n", "I", api.tree.toggle_gitignore_filter, "Toggle: Git Ignore")
      map("n", "gy", api.fs.copy.absolute_path, "Copy Absolute Path")
      map("n", "E", api.tree.expand_all, "Expand All")
      map("n", "W", api.tree.collapse_all, "Collapse All")
      map("n", "l", api.node.open.edit, "Open")
      map("n", "<CR>", api.node.open.edit, "Open")
      map("n", "h", api.node.navigate.parent_close, "Close Directory")
      map("n", "J", api.node.navigate.sibling.first, "First Sibling")
      map("n", "L", api.node.navigate.sibling.last, "Last Sibling")
      map("n", "v", api.node.open.vertical, "Open: Vertical Split")
      map("n", "V", api.node.open.horizontal, "Open: Horizontal Split")
      map("n", "R", api.tree.reload, "Refresh")
      map("n", "?", api.tree.toggle_help, "Help")
      map("n", "P", function()
        local node = api.tree.get_node_under_cursor()
        print(node.absolute_path)
      end, "Print Node Path")
    end

    require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
      on_attach = on_attach,
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      sort_by = "name",
      root_dirs = {},
      prefer_startup_root = false,
      sync_root_with_cwd = false,
      reload_on_bufenter = false,
      respect_buf_cwd = false,
      select_prompts = false,
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✘",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
      },
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { ".git$" },
        exclude = {},
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "shadow",
            style = "minimal",
          },
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
        remove_file = {
          close_window = true,
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap.set

    keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
    keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
    keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
  end,
}

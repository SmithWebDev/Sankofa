require'fyler'.setup({
  hooks = {
    on_delete = function(path)
      print("Deleted: " .. path)
    end,
    on_rename = function(src_path, dst_path)
      print("Renamed: " .. src_path .. " -> " .. dst_path)
    end
  },
  integrations = {
    icon = "mini_icons",
  },
  views = {
    finder = {
      close_on_select = true,
      confirm_simple = false,
      default_explorer = true,
      delete_to_trash = false,
      git_status = {
        enabled = true,
        symbols = {
          Untracked = "?",
          Added = "+",
          Modified = "*",
          Deleted = "x",
          Renamed = ">",
          Copied = "~",
          Conflict = "!",
          Ignored = "#",
        },
      },
      mappings = {
        ["\\"] = "SelectVSplit",
        ["<Space>e"] = "CloseView",
      },
      watcher = {
        enabled = true,
      },
      win = {
        kind_presets = {
          split_left_most = {
            width = "15",
            -- width = "0.25rel",
          },
        },
        buf_opts = {
        },
        win_opts = {
          conceallevel = 3,
          number = false,
          relativenumber = true,
        },
      },
    },
  },
})

vim.keymap.set('n', '<leader>fy', '<cmd>Fyler kind=float<CR>', { desc = 'Open Fyler', silent = true, noremap = true })
vim.keymap.set('n', "<leader>e", "<cmd>Fyler kind=split_left_most<CR>", { desc = 'Open Fyler', silent = true, noremap = true })

vim.o.foldenable = false

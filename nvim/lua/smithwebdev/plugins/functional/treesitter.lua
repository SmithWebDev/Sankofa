require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'css',
    'csv',
    'dockerfile',
    'html',
    'javascript',
    'lua',
    'markdown',
    'markdown_inline',
    'rbs',
    'regex',
    'ruby',
    'scss',
    'tmux',
    'vim',
    'vimdoc',
    'yaml'
  },
  sync_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },

  -- TODO: Keymap Strategy
  -- Incremental selection based on the named nodes from the grammar
  incremental_selection = {
    -- enable = true,
    -- keymaps = {
      --   init_selection = 'gnn',
      --   node_incremental = 'grn',
      --   scope_incremental = 'grc',
      --   node_decremental = 'grm',
      -- },
    },

    --RRethy/nvim-treesitter-endwise
    -- ------------------------------------------------------------
    endwise = {
      enable = true,
    },

    -- nvim-treesitter/playground configuration
    -- ------------------------------------------------------------
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },

    -- nvim-treesitter/nvim-treesitter-textobjects configuration
    -- ------------------------------------------------------------
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          -- You can also use captures from other query groups like `locals.scm`
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },

        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true or false
        include_surrounding_whitespace = true,
      },

      swap = {
        enable = true,
        swap_next = {
          ["<leader><leader>l"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader><leader>h"] = "@parameter.inner",
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          -- ["]m"] = "@function.outer",
          -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
          -- --
          -- -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
          -- ["]o"] = "@loop.*",
          -- -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          -- --
          -- -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          -- ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
          -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          -- ["]M"] = "@function.outer",
          -- ["]["] = "@class.outer",
        },
        goto_previous_start = {
          -- ["[m"] = "@function.outer",
          -- ["[["] = "@class.outer",
        },
        goto_previous_end = {
          -- ["[M"] = "@function.outer",
          -- ["[]"] = "@class.outer",
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          -- ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          -- ["[d"] = "@conditional.outer",
        }
      },

      -- RRethy/nvim-treesitter-textsubjects
      -- -----------------------------------------------------------
      textsubjects = {
        enable = true,
        -- prev_selection = '', -- optional keymap to select the previous selection
        keymaps = {
          -- [''] = 'textsubjects-smart',
          -- [''] = 'textsubjects-container-outer',
          -- [''] = 'textsubjects-container-inner',
        },
      },
    }
  })

  -- nvim-treesitter/nvim-treesitter-context
  -- -----------------------------------------------------------
  require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false, -- Enable multiwindow support.
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  }

  local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

  -- Repeat movement with ; and ,
  -- ensure ; goes forward and , goes backward regardless of the last direction
  vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
  vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
  vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
  vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
  vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- @assignment.inner
-- @assignment.lhs
-- @assignment.outer
-- @assignment.rhs
-- @attribute.inner
-- @attribute.outer
-- @block.inner
-- @block.outer
-- @call.inner
-- @call.outer
-- @class.inner
-- @class.outer
-- @comment.inner
-- @comment.outer
-- @conditional.inner
-- @conditional.outer
-- @frame.inner
-- @frame.outer
-- @function.inner
-- @function.outer
-- @loop.inner
-- @loop.outer
-- @number.inner
-- @parameter.inner
-- @parameter.outer
-- @regex.inner
-- @regex.outer
-- @return.inner
-- @return.outer
-- @scopename.inner
-- @statement.outer

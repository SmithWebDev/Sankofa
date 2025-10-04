vim.print('Lua Snippets loaded')
return {
  s(
    "snip",
    c(1, {
      fmt(
        [[
    -- {}
    s({{
      trig = '{}',
      name = '{}',
      dscr = '{}'
    }},
    {}
    ),

    ]],
        {
          i(1),
          i(2),
          i(3),
          rep(1),
          c(4, {
            { t("{"),      t(""), t("\t"),    i(1), t(""),  t("}") },
            { t("fmt([["), i(1),  t("]], {"), i(2), t("})") },
          }),
        }
      ),
    }
    )
  ),

  -- Neovim Keybind skeleton
  s({
      trig = "key",
      name = "Keybind Skeleton",
      dscr = "Neovim Keybind skeleton",
    },
    fmt([[vim.keymap.set('{}', '{}', '{}', {{ desc = '{}', silent = true, noremap = true }})]], {
      c(1, {
        t("n"),
        t("i"),
        t("v"),
        t("t"),
        t("x"),
      }),
      i(2),
      i(3),
      i(4),
    })
  ),
  -- plugin builder

  s({
      trig = 'plugin',
      name = 'Plugin Builder',
      dscr = 'plugin building snippet'
    },
    fmt(
      [[

        -- {}
        {{
          {}
          dependencies = {{
            {}
          }},
          config = function()
            require('smithwebdev.plugins.configs.{}')
          end
        }},

      ]], {
        i(1),
        i(2),
        i(3),
        i(4)
      }
    )
  ),

  -- config = function()
  --   require('smithwebdev.plugins.config.{}')
  -- end
  -- dependencies = {{
  -- {}
  -- }},

  -- Browse.nvim bookmark creater
  s({
      trig = 'bookcat',
      name = 'Bookmark Category',
      dscr = 'Browse.nvim bookmark creater'
    },
    fmt([[
  ['{}'] = {{
     ['name'] = 'Search For {}'
  }}

  ]], {
      i(1),
      i(2)
    })
  ),

}

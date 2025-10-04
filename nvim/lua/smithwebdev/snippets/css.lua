print('CSS Snippets loaded')
return{
  -- reset margin on all elements
  s({
    trig = 'reset',
    name = 'reset',
    dscr = 'reset margin on all elements'
  },
  fmt([[
  *,
  *::before,
  *::after{{
    margin: 0;
    box-sizing: border-box
  }}


  ]], {})
  ),

  -- 
  s({
    trig = 'cla',
    name = 'clamp()',
    dscr = ''
  },
  fmt([[ clamp({}, {}, {});]], {
    i(2, "minimum"),
    i(1, "desired"),
    i(3, "maximum")
  })
  ),

  -- Defines a size range >= min & <= max
  s({
    trig = 'mm',
    name = 'MinMax()',
    dscr = 'Defines a size range >= min & <= max'
  },
  fmt([[ minmax({}{}, {}{});]], {
    c(1, {
      t("min"),
      t("max-content"),
      t("min-content")
    }),
    c(2, {
      t(''),
      t('px'),
      t('%'),
      t('fr')
    }),
    i(3, "max"),
    c(4, {
      t(''),
      t('px'),
      t('%'),
      t('fr')
    })
  })
  ),

    s("trigger", {
        i(1, "First jump"),
        t(" :: "),
        sn(2, {
            i(1, "Second jump"),
            t" : ",
            i(2, "Third jump")
        })
    })
}

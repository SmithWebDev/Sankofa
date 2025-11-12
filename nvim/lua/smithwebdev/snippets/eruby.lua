print("ERB Snippets loaded")
return {
  -- Turbo Frame Tag --
  s(
    {
      trig = "tft",
      name = "Turbo Frame Tag",
      dscr = "Turbo Frame Tag",
    },
    fmt(
      [[
  <%= turbo_frame_tag {} %>
  ]],
      {
        i(1),
      }
    )
  ),

  ------------------------
  --  Button_to Helper  --
  ------------------------
  s(
    { trig = "btc", name = "Button To", dscr = "Rails 'button to' helper" },
    fmt([[<%= button_to {}, {}{}{}%>]], {
      c(1, {
        { t("'"), i(1), t("'") },
        i(1),
      }),
      c(2, {
        { i(1) },
        { i(1), t("_path") },
        { i(1), t("_path ") },
        { i(1), t("_path("), i(2), t(")") },
        { t("new_"), i(1), t("_path") },
        { t("edit_"), i(1), t("_path("), i(2), t(")") },
        { t("'"), i(1), t("'") },
      }),
      c(3, {
        { i(1) },
        { t(", class: '"), i(1), t("' ") },
        { t(", class: '<%= "), i(1), t("%>' ") },
      }),
      c(4, {
        t(""),
        { i(1) },
        { t(", data: { turbo_frame: "), i(1), t(")}") },
        { t(", data: { turbo_frame: dom_id("), i(1), t(")}") },
        { t(", data: { turbo_method: dom_id("), i(1), t(")}") },
        { t(", data: { turbo_method: :delete") },
        { t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}") },
        { t("method: :delete") },
      }),
    })
  ),

  ------------------------
  --   Link_to helper   --
  ------------------------
  s(
    { trig = "ltc", name = "Link To", dscr = "Rails 'link to' helper" },
    fmt([[<%= link_to {}, {}{}{}%>]], {
      c(1, {
        { t("'"), i(1), t("'") },
        i(1),
      }),
      c(2, {
        { i(1) },
        { i(1), t("_path") },
        { i(1), t("_path ") },
        { i(1), t("_path("), i(2), t(")") },
        { t("new_"), i(1), t("_path") },
        { t("edit_"), i(1), t("_path("), i(2), t(")") },
        { t("'"), i(1), t("'") },
      }),
      c(3, {
        { i(1) },
        { t(", class: '"), i(1), t("' ") },
        { t(", class: '<%= "), i(1), t("%>' ") },
      }),
      c(4, {
        t(""),
        { i(1) },
        { t(", data: { turbo_frame: "), i(1), t(")}") },
        { t(", data: { turbo_frame: dom_id("), i(1), t(")}") },
        { t(", data: { turbo_method: dom_id("), i(1), t(")}") },
        { t(", data: { turbo_method: :delete") },
        { t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}") },
        { t("method: :delete") },
      }),
    })
  ),

  -- Link_to do block
  s(
    {
      trig = "ltd",
      name = "Link To Do Block helper",
      dscr = "Link_to do block",
    },
    fmt(
      [[
  <%= link_to {}{}{} do %>
  {}
  <% end %>
  ]],
      {
        c(1, {
          { i(1) },
          { t("'"), i(1), t("', ") },
        }),
        c(2, {
          { i(1) },
          { i(1), t("_path") },
          { i(1), t("_path ") },
          { i(1), t("_path("), i(2), t(")") },
          { t("new_"), i(1), t("_path") },
          { t("edit_"), i(1), t("_path("), i(2), t(")") },
          { t("'"), i(1), t("'") },
        }),
        i(3),
        i(4),
      }
    )
  ),

  -- Devise sign-in/up template
  s(
    {
      trig = "siso",
      name = "Devise Sign In, Up, Out template",
      dscr = "Devise sign-in/up template",
    },
    fmt(
      [[
  <% if user_signed_in? %>
  <%= link_to 'Sign Out', destroy_user_session_path, data: {{ turbo_method: :delete }}%>
  <% else %>
  <%= link_to 'Sign In', new_user_session_path %>
  <%= link_to 'Sign Up', new_user_registration_path %>
  <% end %>
  ]],
      {}
    )
  ),

  s(
    "snipt",
    fmt(
      [[
  <>(<>, {t('<>')}<>
  <>)<>,]],
      {
        c(1, { t("s"), t("autosnippet") }),
        c(2, { i(nil, "trig"), sn(nil, { t("{trig='"), i(1), t("'}") }) }),
        i(3, "text"),
        i(4, "opts"),
        i(5),
        i(0),
      },
      { delimiters = "<>" }
    )
  ),

  -- Class attribute for erb
  s(
    {
      trig = "cla",
      name = "Class Attr",
      dscr = "Class attribute for erb",
    },
    fmt([[{}]], {
      c(1, {
        { t("class='"), i(), t("'") },
        { t("class: '"), i(), t("'") },
      }),
    })
  ),

  -- Render Partial
  -- s(
  -- 	{
  -- 		trig = "ren",
  -- 		name = "Render Partial snippet",
  -- 		dscr = "Render Partial",
  -- 	},
  -- 	fmt([[<%= render {} %>]], {
  -- 		i(1),
  -- 	})
  -- ),

  -- Render Partial
  s(
    {
      trig = "ren",
      name = "Render Partial snippet",
      dscr = "Render Partial",
    },
    fmt(
      [[
      <%= render {}{}{} %>
      ]],
      {
        c(1, {
          { t("'"), i(1), t("'") },
          { t("partial: '"), i(1), t("'") },
          { t("partial: @"), i(1) },
        }),
        c(2, {
          { t("") },
          { t(", locals: { "), i(1), t(": "), i("2"), t(" }") },
        }),
        i(3),
      }
    )
  ),
}

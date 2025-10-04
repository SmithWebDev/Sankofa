print("Javascript Snippets loaded")
require("smithwebdev.snippets.jest")
return {
	-- Stimulus Targets
	s(
		{ trig = "stt", name = "Stimulus Static Target(s)", dscr = "Stimulus Targets" },
		fmt(
			[[
    static target{} = [ '{}' ]

    ]],
			{
				c(1, {
					t(""),
					t("s"),
				}),
				i(2, "[TARGET_NAME]"),
			}
		)
	),

	-- Stimulus Static Class
	s(
		{
			trig = "stc",
			name = "Stimulus Static Class",
			dscr = "Stimulus Static Class",
		},
		fmt(
			[[
    static classes = [ "{}" ]
    ]],
			{
				i(1),
			}
		)
	),

	-- Stimulus Static Value
	s(
		{ trig = "stv", name = "Stimulus Static Value(s)", dscr = "Stimulus Values" },
		fmt(
			[[
    static value{} = {{ {} }}

    ]],
			{
				c(1, {
					t(""),
					t("s"),
				}),
				i(2, "[VALUE]"),
			}
		)
	),

	-- Stimulus This
	s(
		{ trig = "tt", name = "Stimulus This Statement", dscr = "Stimulus This" },
		fmt([[ this.{} ]], {
			c(1, {
				{
					i(1),
					c(2, {
						{
							i(1, "[DATA_TARGET]"),
							t("Target"),
						},
						{
							i(1, "[DATA_TARGET]"),
							t("Targets"),
						},
						{
							t("has"),
							i(1, "[DATA_TARGET]"),
							t("Target"),
						},
					}),
					t(" = [ '"),
					i(3, "[STATIC_TARGET_NAME]"),
					t("' ]"),
				},
				{
					i(1),
					i(2, "[STATIC_TARGET_NAME]"),
					t("Target"),
					t("."),
					c(3, {
						t("value"),
						i(1, "[value]"),
					}),
				},
			}),
		})
	),

	-- Export Default Class
	s(
		{
			trig = "edc",
			name = "Export Default",
			dscr = "Export Default Class",
		},
		fmt(
			[[
    export default class extends Controller {{
      {}
    }}
    ]],
			{
				i(1),
			}
		)
	),

	-- Stimulus Functions
	s(
		{
			trig = "func",
			name = "JS Function",
			dscr = "Stimulus Functions",
		},
		fmt(
			[[
    {}{}() {{
      {}
    }}
    ]],
			{
				c(1, {
					t(""),
					t("function "),
				}),
				i(2, "[FUNCTION NAME]"),
				i(3, "[FUNCTION BODY]"),
			}
		)
	),

	-- Stimulus Default index value
	s(
		{
			trig = "idx",
			name = "Init Index Number Value",
			dscr = "Stimulus Default index value",
		},
		fmt(
			[[
  index: {{ type: {}, default: {} }}
  ]],
			{
				c(1, {
					{ t("Number") },
					{ i(1) },
				}),
				i(2, "0"),
			}
		)
	),
}

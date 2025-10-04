print("HTML Snippets loaded")
return {
	-- Stimulus Data Action
	s(
		{
			trig = "da",
			name = "Stimulus Data Action",
			dscr = "Stimulus Data Action",
		},
		fmt(
			[[
    data-action='{}'
    ]],
			{
				i(1),
			}
		)
	),

	-- Stimulus Data Controller --
	s(
		{
			trig = "dc",
			name = "Stimulus Data Controller",
			dscr = "Stimulus Data Controller",
		},
		fmt(
			[[
    data-controller="{}"
    ]],
			{
				i(1),
			}
		)
	),

	-- Stimulus Value Index
	s(
		{
			trig = "di",
			name = "Data Index",
			dscr = "Stimulus Value Index",
		},
		fmt(
			[[
    data-index='{}'
    ]],
			{
				i(1),
			}
		)
	),

	-- Stimulus Data Target
	s(
		{
			trig = "dt",
			name = "Stimulus Data Target",
			dscr = "Stimulus Data Target",
		},
		fmt(
			[[
    data-{}-target="{}"
    ]],
			{
				i(1, "[CONTROLLER_NAME]"),
				i(2, "[TARGET_NAME]"),
			}
		)
	),

	-- Stimulus Controller Value call
	s(
		{
			trig = "dv",
			name = "Data controller value",
			dscr = "Stimulus Controller Value call",
		},
		fmt(
			[[
    data-{}-{}-value="{}"
    ]],
			{
				i(1, "Controller Name"),
				i(2, "Attribute Name"),
				i(3, "Starting Value"),
			}
		)
	),

	-- Stimulus Data Attribute
	s(
		{
			trig = "data",
			name = "Data Attribute",
			dscr = "Stimulus Data Attribute",
		},
		fmt(
			[[
    data{}
    ]],
			{
				c(1, {
					{
						i(1),
						t("='"),
						i(2),
						t("'"),
					},
					{
						-- put an insertNode here so it's possible
						-- to change the outer choice.
						-- (without it, the cursor would always jump
						-- directly into the inner choiceNode).
						i(1),
						t("-action='"),
						c(2, {
							{
								i(1),
								i(2, "[EVENT]"),
								t("->"),
								i(3, "[CONTROLLER]"),
								t("#"),
								i(4, "[FUNCTION]"),
								t("'"),
							},
							{
								i(1),
								i(2, "[CONTROLLER]"),
								t("#"),
								i(3, "[FUNCTION]"),
								t("'"),
							},
						}),
					},
					{
						i(1),
						t("-controller='"),
						i(2, "[CONTROLLER_NAME]"),
						t("'"),
					},
					{
						i(1),
						t("-"),
						i(2, "[CONTROLLER_NAME]"),
						t("-target='"),
						i(3, "[TARGET_NAME]"),
						t("'"),
					},
					{
						i(1),
						t("-"),
						i(2, "[CONTROLLER_NAME]"),
						t("-value='"),
						i(3, "[VALUE_NAME]"),
						t("'"),
					},
					{
						i(1),
						t("-"),
						i(2, "[CLASS_NAME]"),
						t("-class='"),
						i(3, "[CLASS_NAME]"),
						t("'"),
					},
				}),
			}
		)
	),

	-- Stimulus Action Descriptor
	s(
		{
			trig = "action",
			name = "Action Descriptor",
			dscr = "Stimulus Action Descriptor",
		},
		fmt(
			[[
    {}->{}#{}
    ]],
			{
				c(1, {
					t("change"),
					t("click"),
					t("input"),
					t("submit"),
					i(1, "[CUSTOM EVENT]"),
				}),
				i(2, "[CONTROLLER]"),
				i(3, "[FUNCTION]"),
			}
		)
	),
}

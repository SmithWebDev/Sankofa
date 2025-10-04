print("RSpec Snippets Loaded")

return {
	-- RSpec description boilerplate
	s(
		{
			trig = "rd",
			name = "RSpec Describe Statement",
			dscr = "RSpec description boilerplate",
		},
		fmt(
			[[
  RSpec.describe {} do
    {}
  end
  ]],
			{
				c(1, {
					{ i(1, "ClassName") },
					{ t("'"), i(1, "Arbitrary String"), t("'") },
				}),
				i(0),
			}
		)
	),

	-- Psuedo code snippet for test scenario planning
	s(
		{
			trig = "tp",
			name = "Test Scenario Planning/ Psuedo-Code",
			dscr = "Psuedo code snippet for test scenario planning",
		},
		fmt(
			[[
    # Scenario: {}

    # Expectation: {}
  ]],
			{
				i(1, "When a user..."),
				i(2, "the user's"),
			}
		)
	),

	-- be_valid
	s({
		trig = "bv",
		name = "Be Valid",
		dscr = "be_valid",
	}, fmt([[be_valid]], {})),
}

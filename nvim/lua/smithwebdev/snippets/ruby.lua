print("Ruby Snippets Loaded")
-- require("smithwebdev.snippets.rspec")
-- require("lua.smithwebdev.snippets.rspec")

return {
	-- Attr_{Reader, Writer, Accessor}
	s(
		{ trig = "aa", name = "Attr options", dscr = "Attr options" },
		fmt([[attr_{} :]], {
			c(1, {
				t("accessor"),
				t("reader"),
				t("writer"),
			}),
		})
	),

	-- Model Validations
	s(
		{ trig = "val", name = "Model Validation", dscr = "Validates" },
		fmt([[validates :{}]], {
			i(1),
		})
	),

	-- Model Validations, presence: true/false
	s(
		{ trig = "pres", name = "Model Presence", dscr = "Model Validations, presence: true/false" },
		fmt([[presence: {}]], {
			c(1, {
				t("true"),
				t("false"),
			}),
		})
	),

	-- Model Validations, uniqueness: true/false
	s(
		{ trig = "uni", name = "Model Uniqueness", dscr = "Model Validations, uniqueness: true/false" },
		fmt([[uniqueness: {}]], {
			c(1, {
				t("true"),
				t("false"),
				{ t("{ scope: :"), i(1) },
			}),
		})
	),

	-- Model Before Validation
	s(
		{ trig = "bval", name = "Before Model Validation", dscr = "Before Validation" },
		fmt([[before_validation :{}]], {
			i(1),
		})
	),

	-- Resource Routes
	s(
		{ trig = "res", name = "Resources", dscr = "Resource Routes" },
		fmt([[resources :{}]], {
			i(1),
		})
	),

	-- Before Action
	s(
		{ trig = "ba", name = "Before Action", dscr = "Before Action" },
		fmt([[before_action :{}]], {
			c(1, {
				t(""),
				i(1),
				{ i(1), t(", only: ["), i(2), t("]") },
			}),
		})
	),

	-- Console command for Rails view
	s({ trig = "con", name = "Console", dscr = "Console command for Rails view" }, fmt([[  console]], {})),

	-- Redirect_to
	s(
		{ trig = "rdt", name = "Redirect To helper", dscr = "Redirect_to" },
		fmt([[redirect_to {}_path{}]], {
			i(1),
			c(2, {
				t(""),
				{ t(", notice: '"), i(1), t("'") },
			}),
		})
	),

	-- Params private method
	s(
		{ trig = "prm", name = "Controller Params method", dscr = "Params private method" },
		fmt(
			[[
  def {}_params
    params.require(:{}).permit(:{})
  end
  ]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),

	-- Ruby Model Association - Has One Attached
	s(
		{ trig = "ho", name = "Has One", dscr = "Ruby Model Association - Has One" },
		fmt([[has_one :{}]], {
			c(1, {
				i(1),
				{ i(1), t(", through: :"), i(2) },
				{ i(1), t(", dependent: :"), i(2) },
			}),
		})
	),

	-- Ruby Model Association - Has One
	s(
		{ trig = "hoa", name = "Has One Attached", dscr = "Ruby Model Association - Has One Attached" },
		fmt([[has_one_attached :{}]], {
			c(1, {
				i(1),
				{ i(1), t(", through: :"), i(2) },
				{ i(1), t(", dependent: :"), i(2) },
			}),
		})
	),

	-- Ruby Model Association - Has Many
	s(
		{ trig = "hm", name = "Has Many", dscr = "Ruby Model Association - Has Many" },
		fmt([[has_many :{}]], {
			c(1, {
				i(1),
				{ i(1), t(", through: :"), i(2) },
				{ i(1), t(", dependent: :"), i(2) },
			}),
		})
	),

	-- Ruby Model Association - Has Many Attached
	s(
		{ trig = "hma", name = "Has Many Attached", dscr = "Ruby Model Association - Has Many Attached" },
		fmt([[has_many_attached :{}]], {
			c(1, {
				i(1),
				{ i(1), t(", through: :"), i(2) },
				{ i(1), t(", dependent: :"), i(2) },
			}),
		})
	),

	-- Ruby Model Association - Has Rich Text
	s(
		{ trig = "hrt", name = "Has Rich Text", dscr = "Ruby Model - Has Rich Text" },
		fmt([[has_rich_text :{}]], {
			c(1, {
				i(1),
				{ i(1), t(", through: :"), i(2) },
				{ i(1), t(", dependent: :"), i(2) },
			}),
		})
	),

	-- Secure Password helper
	s(
		{
			trig = "hsp",

			name = "Has Secure Password",
			dscr = "Secure Password helper",
		},
		fmt(
			[[
    has_secure_password
    validates :password,
    presence: true
    ]],
			{}
		)
	),

	-- Strip Whitespace
	s(
		{ trig = "swp", name = "Strip Whitespace", dscr = "Strip Whitespace" },
		fmt(
			[[
    self.{} = self.{}&.strip
    def strip_extraneous_spaces
      self.{} = self.{}&.strip
    end
    ]],
			{
				i(1),
				rep(1),
				i(2),
				rep(2),
			}
		)
	),

	-- Schema Validations default: true/fale
	s(
		{
			trig = "defa",
			name = "Default true/false",
			dscr = "Schema Validations default: true/fale",
		},
		fmt([[default: {}]], {
			c(1, {
				t("true"),
				t("false"),
			}),
		})
	),

	-- Req Rails/Spec Helper
	s(
		{
			trig = "rh",
			name = "Require Rails/Spec Helper",
			dscr = "Req Rails/Spec Helper",
		},
		fmt([[require '{}_helper']], {
			c(1, {
				t("rails"),
				t("spec"),
			}),
		})
	),

	------------------------
	--   RSPEC Snippets   --
	------------------------

	-- it block or one-liner
	--s(
	--  {
	--    trig = "it",
	--    name = "It block options",
	--    dscr = "it block or one-liner",
	--  },
	--  fmt(
	--    [[
	--{}
	--]],
	--    {
	--      c(1,),
	--    }
	--  )
	--),

	-- Collection matcher
	s(
		{
			trig = "ma",
			name = "Match Array",
			dscr = "Collection matcher",
		},
		fmt([[match_array({})]], {
			i(1),
		})
	),

	-- Context block
	s(
		{
			trig = "cb",
			name = "Context block",
			dscr = "Context block",
		},
		fmt(
			[[
        context {} do
        {}
      end
      ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- Expect To_Not
	s(
		{
			trig = "!exp",
			name = "Expect To Not",
			dscr = "Expect To_Not",
		},
		fmt([[expect({}).to_not {}]], {
			i(1),
			i(2),
		})
	),

	-- RSpec describe statement
	s(
		{
			trig = "rsd",
			name = "RSpec describe statement",
			dscr = "RSpec describe statement",
		},
		fmt(
			[[
      RSpec.describe {}{} do
      {}
    end
    ]],
			{
				c(1, {
					i(1),
					{ t("'"), i(1), t("'") },
				}),
				c(2, {
					i(1),
					t(", type: :model"),
					t(", type: :controller"),
					t(", type: :mailer"),
					t(", type: :view"),
					t(", type: :routing"),
					t(", type: :helper"),
					t(", type: :request"),
					t(", type: :feature"),
					t(", type: :system"),
				}),
				i(3),
			}
		)
	),

	-- Rspec be_valid
	s({ trig = "bv", name = "Be Valid", dscr = "Rspec be_valid" }, fmt([[be_valid]], {})),

	-- Before block
	s(
		{
			trig = "b4",
			name = "Before Block",
			dscr = "Before block",
		},
		fmt(
			[[
    before{} do
    {}
    end
    ]],
			{
				c(1, {
					{ t(" :"), i(1) },
					{ i(1) },
				}),
				i(2),
			}
		)
	),
	-- Belong To
	s(
		{
			trig = "bt",
			name = "Belong To",
			dscr = "Belong To ",
		},
		fmt([[belong_to{}]], {
			c(1, {
				{ t(" :"), i(1) },
				{ t("(:"), i(1), t(")") },
			}),
		})
	),

	-- Counter Cache option
	s(
		{
			trig = "cc",
			name = "Counter Cache model option",
			dscr = "Counter Cache option",
		},
		fmt([[counter_cache: {}]], {
			c(1, {
				t("true"),
				t("false"),
			}),
		})
	),

	-- Have Link
	s(
		{
			trig = "hv",
			name = "Have Link",
			dscr = "Have Link",
		},
		fmt([[have_link '{}']], {
			i(1),
		})
	),

	-- Have Css/Content
	s(
		{
			trig = "hc",
			name = "Have Css/Content",
			dscr = "Have Css/Content",
		},
		fmt([[have_css('{}'{})]], {
			i(1),
			{ t(", "), i(2) },
		})
	),

	-- Have CSS/ Content
	-- s({
	-- 	trig = "hc",
	-- 	name = "Have CSS/Content",
	-- 	dscr = "Have CSS/ Content",
	-- }, {
	-- 	c(1, {
	-- 		fmt("have_css('{}'{})", {
	-- 			i(1),
	-- 			{ t(", "), i(2) },
	-- 		}),
	--      fmt([[
	--      have_content({})]], {
	-- 			i(1),
	-- 		}),
	-- 	}),
	-- }),

	-- Have Received
	s(
		{
			trig = "hr",
			name = "Have received",
			dscr = "Have Received",
		},
		fmt([[have_received({})]], {
			i(1),
		})
	),

	------------------------
	-- Capybara Snippets  --
	------------------------

	-- Find All
	s(
		{
			trig = "fa",
			name = "Find All elements",
			dscr = "Find All",
		},
		fmt([[find_all('{}')]], {
			i(1, "element"),
		})
	),

	-- Be Successful
	s({
		trig = "bs",
		name = "Be Successful Expectation",
		dscr = "Be Successful",
	}, fmt([[be_successful]], {})),

	--------------------------------------------------------------------------------
	--                              Shoulda Matchers                              --
	--------------------------------------------------------------------------------

	------------------------
	--    ActiveModel     --
	------------------------

	-- Shoulda Matchers - Allow Value test that an attribute is valid or invalid
	-- if set to one or more values
	s(
		{
			trig = "av",
			name = "Allow Value",
			dscr = "Shoulda Matchers - Allow Value test that an attribute is valid or invalid if set to one or more values",
		},
		fmt([[allow_value{}({}){}]], {
			c(1, {
				{ t("s") },
				{ t("") },
			}),
			i(2),
			c(3, {
				{ t("") },
				{ t(".for("), i(1), t(")") },
				{ t(".for("), i(1), t(").on("), i(2), t(")") },
			}),
		})
	),

	-- Shoulda Matchers - Validates Presence Of
	s(
		{
			trig = "valp",
			name = "Validates Presence",
			dscr = "Shoulda Matchers - Validates Presence Of",
		},
		fmt([[validate_presence_of :{}]], {
			i(1),
		})
	),

	-- Shoulda Matchers - Validates Uniqueness Of
	s(
		{
			trig = "valu",
			name = "Validates Uniqueness",
			dscr = "Shoulda Matchers - Validates Uniqueness Of",
		},
		fmt([[validate_uniqueness_of :{}]], {
			i(1),
		})
	),

	--------------------------------------------------------------------------------
	--                                  Capybara                                  --
	--------------------------------------------------------------------------------

	-- Capybara routing matcher - Has Current Path
	s(
		{
			trig = "hcp",
			name = "Have Current Path",
			dscr = "Capybara routing matcher - Has Current Path",
		},
		fmt([[have_current_path({})]], {
			i(1),
		})
	),
}

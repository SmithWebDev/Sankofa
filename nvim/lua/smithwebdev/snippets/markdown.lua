print("markdown loaded")
-- require("smithwebdev.snippets.obsidian")
return {
	-- ------------------------
	--Markdown Landuage Block--
	------------------------
	s(
		{
			trig = "mlb",
			name = "Markdown language block",
			dscr = "Markdown Language Block",
		},
		fmt(
			[[
      ```{}
      {}
      ```
      ]],
			{
				c(1, {
					i(1),
					t("rb"),
				}),
				i(2),
			}
		)
	),

	------------------------
	--Pull Request Template--
	------------------------
	s(
		{
			trig = "prd",
			name = "Pull Request Description",
			dscr = "Description for Pull Request",
		},
		fmt(
			[[
  {}/{}-{}
  [{} PT-{}]  {}

  ## Objective

    As a(n) {},
    When {}
    I {} to {}
    In order to {}

  ## Solution

    {}

  ## Technical Changes

    - {}

  ## Task

    [{}]({})

  ### Deliver Check List

    - [ ] Update PR title to follow format: `[Feature|Chore|Bug PT-{{pivitol_issue_number}}] Description of your work`
    - [ ] Ensure Circle CI passes
    - [ ] Request code review on Github
    - [ ] Once reviewed, reviewer should add "Code Review" field to Pivotal ticket
    - [ ] Ensure Heroku app deploys successfully
    - [ ] Wait for Heroku to automatically provision DB, this will start a few minutes after app creation
    - [ ] Link your PR to the Pivotal ticket
    - [ ] Mark your Pivotal ticket 'Finish'
    - [ ] Leave a comment in your ticket with a link to the test app
    - [ ] Update test notes if you made changes that isnt part of the AC
    - [ ] Squash your PR when approved and passes QA
    - [ ] Update Pivotal Ticket to let QA know it's on staging
      ]],
			{
				c(1, {
					t("Bugs"),
					t("Chores"),
					t("Features"),
				}),
				i(2),
				i(3),
				rep(1),
				rep(2),
				rep(3),
				i(4),
				i(5),
				c(6, {
					t("want"),
					t("dont want"),
				}),
				i(7),
				i(8),
				i(9),
				i(10),
				rep(3),
				i(0),
			}
		)
	),

	------------------------
	--User Story Template --
	------------------------
	s(
		{
			trig = "stt",
			name = "story tracker template",
			dscr = "creates template for story tracking",
		},
		fmt(
			[[
    **As a(n)** {},
    **When** {}
    **I want to** {}
    **In order to** {}

    **Acceptance Criteria**
    - {}

    **Why**
    - {}

    **Notes**
    - {}

    **Dev Notes**
    - {}

    **Test Notes**
    ]],
			{ i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8) }
		)
	),

	--------------------------------------------------------------------------------
	--                             Obsidian Snippets                              --
	--------------------------------------------------------------------------------

	-- Obsidian default metadata
	s(
		{
			trig = "obmeta",
			name = "Obsidian Template",
			dscr = "Obsidian default metadata",
		},
		fmt(
			[[
  ---
  Type: #type/{}  
  Area: #area/{}  
  Keywords: #keyword/{}  
  Status: #status/{}  
  Date Created: {}  
  Source: {}  
  ---
  ]],
			{
				i(1),
				c(2, {
					i(1, "What's this about?"),
					t("Money"),
					t("Personal"),
					t("Personal Finances"),
					t("Rails"),
					t("Ruby"),
				}),
				i(3),
				i(4),
				c(5, {
					i(1),
					t("{{date}}"),
				}),
				i(6),
			}
		)
	),

	-- Term & Definition snippet for Obsidian note taking
	s(
		{
			trig = "def",
			name = "Define ",
			dscr = "Term & Definition snippet for Obsidian note taking",
		},
		fmt(
			[[
    [Term:: {}] [Definition:: {}]
    ]],
			{
				i(1),
				i(2),
			}
		)
	),

	-- Term & Definition snippet for Obsidian note taking
	s({
		trig = "def",
		name = "",
		dscr = "Term & Definition snippet for Obsidian note taking",
	}, {}),

	-- Obsidian Type Snippet
	s(
		{
			trig = "#ty",
			name = "Type sublinks",
			dscr = "Obsidian Type Snippet",
		},
		fmt([[#type/{}]], {
			i(1),
		})
	),

	-- Obsidian Area Snippet
	s(
		{
			trig = "#ar",
			name = "Area sublinks",
			dscr = "Obsidian Area Snippet",
		},
		fmt([[#area/{}]], {
			i(1),
		})
	),

	-- Obsidian Keyword Snippet
	s(
		{
			trig = "#key",
			name = "Keyword sublinks",
			dscr = "Obsidian Keyword Snippet",
		},
		fmt([[#keyword/{}]], {
			i(1),
		})
	),

	-- Markdown snippet for API Endpoint
	s({
		trig = "apie",
		name = "API Endpoint",
		dscr = "Markdown snippet for API Endpoint",
	}, fmt([[### API Endpoint]], {})),

	-- API Key Options
	s({
		trig = "apik",
		name = "API Key Options",
		dscr = "API Key Options",
	}, fmt([[### Key Options]], {})),

	-- API Hash Options
	s({
		trig = "apio",
		name = "API Hash Options",
		dscr = "API Hash Options",
	}, fmt([[### Hash Options]], {})),

	-- Github Projects Feature Card
	s(
		{
			trig = "feat",
			name = "Feature Card",
			dscr = "Github Projects Feature Card",
		},
		fmt(
			[[
  Title: {}
  Description: {}
  Acceptance Criteria: {}
  Priority: {}
  Labels: {}
  Linked Issues: {}
  Comments: {}
  ]],
			{
				i(1, "Clear and concise feature name"),
				i(2, "Detailed explanation of the feature's purpose and functionality"),
				i(3, "Specific conditions that must be met for the feature to be considered complete"),
				c(4, {
					t("high"),
					t("medium"),
					t("low"),
				}),
				c(5, {
					t("frontend"),
					t("backend"),
					t("bug"),
					t("enhancement"),
				}),
				i(6, "Related issues or tasks"),
				i(7, "Discussion, questions, or notes"),
			}
		)
	),

	-- Github Issue Template
	s(
		{
			trig = "iss",
			name = "Github Issue Template",
			dscr = "Github Issue Template",
		},
		fmt(
			[[
  # {} {}

  Description:  
    - {}  
    - {}  

  Assignee:  
    - {}  

  Start Date:  
    - {}  

  End Date:  
    - {}  

  Linked Issues:  
    - {}  

  Comments:  
    - {}  

  ]],
			{
				c(1, {
					t("[Feature]"),
					t("[Enhancement]"),
					t("[Bug]"),
					t("[Frontend]"),
					t("[Backend]"),
				}),
				i(2, "Clear and concise title describing the issue"),
				i(3, "Detailed explanation of the issue, including steps to reproduce it if applicable"),
				i(4, "Any relevant error messages, screenshot, or logs"),
				c(5, {
					t("smithwebdev"),
					i(1),
				}),
				i(6, "Start Date"),
				i(7, "End Date"),
				i(8),
				i(9),
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
    1. **Scenario:** {}

        a. **Expectation:** {}
  ]],
			{
				i(1, "When a user..."),
				i(2, "the user's"),
			}
		)
	),

	-- mom perscription template
	s(
		{
			trig = "pers",
			name = "Perscription template",
			dscr = "mom perscription template",
		},
		fmt(
			[[
    - {}
      - Usage: {}
      - PerscribedBy: {}
      - Instructions: {}
      - Refill: {}
      - Expiration: {}
    ]],
			{
				i(1, "Name of Perscription"),
				i(2),
				i(3, "Doctor's Name"),
				i(4),
				i(5),
				i(6),
			}
		)
	),
	-- Anime shorthand
	s({
		trig = "a-",
		name = "Anime link creation",
		dscr = "Anime shorthand",
	}, { t("[[Anime - "), i(1), t("|"), rep(1), t("]]") }),



-- Universal prompt template (long form)
s({
  trig = 'unip',
  name = 'Universal Prompt Template',
  dscr = 'Universal prompt template (long form)'
},
  fmt([[
You are to act as: {}

GOAL / INTENT:
- I want you to produce: {}
- Purpose / why I need this: {}

CONTEXT:
- Background information: {}
- Important domain details: {}

REQUIREMENTS (Must-Haves):
- Include: {}
- Constraints: {}
- What to avoid: {}

OUTPUT FORMAT:
- Format the response as: {}
- Structure: {}

STYLE & EXAMPLES:
- Match this tone/style: {}
- Follow this structure: {}

AUDIENCE:
- The audience is: {}
- Level of detail required: {}

BOUNDARIES:
- Scope is limited to: {}
- Do NOT include: {}

SUCCESS CRITERIA:
- A correct response will: {}
- Must satisfy: {}

CLARIFICATION RULE:
- If anything is ambiguous, ask clarifying questions *before* producing the final output.

FINAL DELIVERABLE RULE:
- Produce only the final formatted answer with no preamble.
]], {
      i(1, "[role/persona]"),
      i(2, "[describe deliverable]"),
      i(3, "[optional but helpful]"),
      i(4, "[project, scenario, purpose]"),
      i(5, "[tech stack, concepts, definitions]"),
      i(6, "[bullet list of necessary items]"),
      i(7, "[length, tone, depth, perspective]"),
      i(8, "[no filler, no code, no explanations, etc.]"),
      i(9, "[bullets, numbered list, sections, code, table, etc.]"),
      i(10, "[define headings or ordering]"),
      i(11, "[paste example or describe tone]"),
      i(12, "[provide structure sample]"),
      i(13, "[expert, beginner, recruiter, engineer, client]"),
      i(14, "[high-level, deep technical, etc.]"),
      i(15, "[specific focus]"),
      i(16, "[disallowed content]"),
      i(17, "[define how you will judge accuracy/success]"),
      i(18, "[explicit acceptance criteria]"),
    })
)
}

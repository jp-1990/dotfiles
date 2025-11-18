require("luasnip.session.snippet_collection").clear_snippets()
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	-- history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "Error" } },
			},
		},
	},
})

vim.keymap.set({ "i" }, "<M-l>", function()
	ls = require("luasnip")
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local k = require("luasnip.nodes.key_indexer").new_key

local function capitalize(str)
	return (str:gsub("^%l", string.upper))
end

local function trim(str)
	return str:match("^%s*(.-)%s*$")
end

local function split(str, regex)
	local t = {}
	for s in string.gmatch(str, regex) do
		table.insert(t, trim(s))
		break
	end
	return t
end

local function join(t, sep)
	return table.concat(t, sep)
end

local js_console_log = s(
	"log",
	fmta([[console.log('<label>', <value>);]], {
		label = rep(1),
		value = i(1),
	})
)

local js_fn = s(
	"fn",
	fmta(
		[[
<exportType><type><export><async>function <name>(<args><argsType>) {
  <body>
}
]],
		{
			export = c(1, { t(""), t("export ") }),
			async = c(2, { t(""), t("async ") }),
			name = i(3),
			args = d(4, function(args)
				local strings = {}

				for _, arg in ipairs(args[1]) do
					local splitArg = split(arg, "([^:]+)")
					table.insert(strings, join(splitArg))
				end

				return sn(
					nil,
					fmta([[{ <arg> }]], {
						arg = join(strings, ", "),
					})
				)
			end, k("types")),
			exportType = rep(1),
			type = d(5, function(args)
				return sn(
					nil,
					fmta(
						[[
type <name>Args = {
  <body>
}


				      ]],
						{
							name = capitalize(args[1][1]),
							body = i(1, "", { key = "types" }),
						}
					)
				)
			end, { 3 }),
			argsType = d(6, function(args)
				return sn(
					nil,
					fmta(
						[[
: <argsType>Args
				            ]],
						{
							argsType = capitalize(args[1][1]),
						}
					)
				)
			end, { 3 }),
			body = i(0),
		}
	)
)

local react_fn_component = s(
	"rfc",
	fmta(
		[[
<exportType><type><export><async>function <name>(<args><argsType>) {
  <body>
  <return_>
}
]],
		{
			export = c(1, { t(""), t("export ") }),
			async = c(2, { t(""), t("async ") }),
			name = i(3),
			args = d(4, function(args)
				local strings = {}

				for _, arg in ipairs(args[1]) do
					local splitArg = split(arg, "([^:]+)")
					table.insert(strings, join(splitArg))
				end

				return sn(
					nil,
					fmta([[{ <arg> }]], {
						arg = join(strings, ", "),
					})
				)
			end, k("types")),
			exportType = rep(1),
			type = d(5, function(args)
				return sn(
					nil,
					fmta(
						[[
type <name>Props = {
  <body>
}


				      ]],
						{
							name = capitalize(args[1][1]),
							body = i(1, "", { key = "types" }),
						}
					)
				)
			end, { 3 }),
			argsType = d(6, function(args)
				return sn(
					nil,
					fmta(
						[[
: <argsType>Args
				            ]],
						{
							argsType = capitalize(args[1][1]),
						}
					)
				)
			end, { 3 }),
			body = i(0),
			return_ = t("return <div></div>"),
		}
	)
)

-- ls.add_snippets("lua", { react_fn_component })
ls.add_snippets("typescript", {
	js_console_log,
	js_fn,
})
ls.add_snippets("typescriptreact", {
	js_console_log,
	js_fn,
	react_fn_component,
})

return {}

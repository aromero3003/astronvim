local ls = require("luasnip")
local s = ls.snippet
-- local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
-- local l = extras.lambda
local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

return {
    ms({
            common = { dscr = "Include only once", prior = 500 },
            "include once",
            "inconce",
            "#inconce",
            "once",
        },
        fmta([[
        #ifndef <>
        #define <>

        <>

        #endif  /* <> */
        ]],
            {
                d(1, function(_, parent)
                    return sn(1, { i(1, "__" .. string.upper(parent.env.TM_FILENAME:gsub("%..+$", "")) .. "_H__") })
                end),
                rep(1),
                i(0),
                rep(1)
            }
        ),
        {}
    ),
    ms({
            common = { dscr = "Print variable's name and value" },
            "priv",
            "printv",
        },
        fmta('printf("<> = %<>\\n", <>);', { i(2), i(1, "i"), rep(2) }, {}),
        {}
    ),
}

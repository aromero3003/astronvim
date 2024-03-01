local ls = require("luasnip")
local s = ls.snippet
local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
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
-- local ms = ls.multi_snippet

return {
    s(
        {
            trig = "nsfile",
            dscr = "Abbreviations for a new LuaSnip snippets file",
            priority = 10,
        },
        {
            t({
                'local ls = require("luasnip")',
                'local s = ls.snippet',
                '-- local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })',
                '-- local sn = ls.snippet_node',
                '-- local isn = ls.indent_snippet_node',
                '-- local t = ls.text_node',
                '-- local i = ls.insert_node',
                '-- local f = ls.function_node',
                '-- local c = ls.choice_node',
                '-- local d = ls.dynamic_node',
                '-- local r = ls.restore_node',
                '-- local events = require("luasnip.util.events")',
                '-- local ai = require("luasnip.nodes.absolute_indexer")',
                '-- local extras = require("luasnip.extras")',
                '-- local l = extras.lambda',
                '-- local rep = extras.rep',
                '-- local p = extras.partial',
                '-- local m = extras.match',
                '-- local n = extras.nonempty',
                '-- local dl = extras.dynamic_lambda',
                '-- local fmt = require("luasnip.extras.fmt").fmt',
                '-- local fmta = require("luasnip.extras.fmt").fmta',
                '-- local conds = require("luasnip.extras.expand_conditions")',
                '-- local postfix = require("luasnip.extras.postfix").postfix',
                '-- local types = require("luasnip.util.types")',
                '-- local parse = require("luasnip.util.parser").parse_snippet',
                '-- local ms = ls.multi_snippet',
                ''
            }),
        }
    ),
    s(
        {
            trig = "snipdef",
            dscr = "A general snippet definition",
            priority = 10,
        },
        fmta([[
            s(
                {
                    trig ="<trig>",
                    dscr = "<dscr>",
                },
                {
                    <nodes>
                },
                {<opts>}
            ),
            ]],
            { trig = i(1), dscr = i(2), nodes = i(3), opts = i(4) },
            {}
        ),
        {}
    ),
    as("asnip", fmta("as(<>, <>),", { i(1), i(2) })),
    s(
        {
            trig = "snipdefm",
            dscr = "A multiple snippet definition",
        },
        fmta([[
            ms({
                    common = { dscr = "<>" },
                    "<>",
                    "<>",
                },
                <>,
                {}
            ),
            ]],
            { i(1, "description"), i(2, "trig1"), i(3, "trig2"), i(4) },
            {}
        ),
        {}
    ),
}

local ls = require("luasnip")
local s = ls.snippet
local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })
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
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet






return {
    -- Example: how to set snippet parameters
    require("luasnip").snippet(
        {
            --Table 1: snippet parameters
            trig = "hialan",
            dscr = "An autotriggering snippet that expands 'hi' into 'Hello, world!'",
            regTrig = false,
            priority = 100,
            --snippetType = "autosnippet"
        },
        {                       --Table 2 snippet nodes (don't owrrt about this fot now --- we'll cover nodes shortly)
            t("holle, world!"), -- A single text node
        }
    --table 3, the advanced snippet options, is left blank.
    ),
    -- as("tst", { i(1), t ' - ', i(2, "hola"), t ' - ', rep(2) }),

    as("select", f(function(_, snip)
        local res, env = {}, snip.env
        table.insert(res, env.TM_FILENAME)
        table.insert(res, "in: ")
        return res
    end, {})),

    as("tst", { d(1, function(_, parent)
        return sn(1, { i(1, parent.env.TM_FILENAME) })
    end), t " current file: ", rep(1) }, {})


}

local ls = require("luasnip")
local s = ls.snippet
local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
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

--[[
    Lista de snippets fallando
     - table : lo sobreescribe el otro luasnip-latex-snippets
     - itm : solo deberia triggerear cuando está en un entorno de lista (extra_opts = {condition})
     -

--]]
return {
    as("drw", t"\\draw"),
    as("draw", t"\\draw"),
    s(
        {
            trig ="sysco",
            dscr = "Conventional coordenate system",
        },
        {
            t{
                "\\coordinate [label=below left:O] (a) at (0,0);",
                "\\draw[-latex] (0,0) -- (.7,0) node[below] {$x$};",
                "\\draw[-latex] (0,0) -- (0,.7) node[left] {$y$};",
                "\\draw[-stealth] (0.45,0.1)  arc (0:90:0.35) node[midway,above right]{$\\vec{\\tau}$};",
                "\\draw (0,0) circle(.1);",
                "\\filldraw (0,0) circle(1pt) node[above left]{$z$};",
            }
        },
        {}
    ),
}

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
    ms({
            common = {
                dscr = "A general template for a LaTeX file",
                snippetType = "snippet",
                priority = 0,
            },
            "template",
            "tmplt"
        },
        fmta([[
            \documentclass[a4paper]{article}

            \usepackage[utf8]{inputenc}
            \usepackage[T1]{fontenc}
            \usepackage[spanish]{babel}
            \usepackage{amsmath, amssymb}


            \begin{document}
	            <>
            \end{document}
        ]], { i(0) }, {}),
        {}
    ),
    -- s(
    --     { trig = "pac2", dscr = "Package" },
    --     fmta("\\usepackage<><><>{<>}",
    --         {
    --             f(function(args, _, _) return args[1][1] == "" and "" or "[" end, { 2 }, {}),
    --             i(2, "options"),
    --             f(function(args,_, _) return args[1][1] == "" and "" or "]" end, { 2 }, {}),
    --             i(4, "package"),
    --         }
    --     ),
    --     {}
    -- ),

    s(
        { trig = "pac", name = "Package", dscr = "A package", },
        fmta("\\usepackage<><><>{<>}",
            { f(function(args, _, _) return args[1][1] == "" and "" or "[" end, 1, {}),
                i(1, "options"),
                f(function(args, _, _) return args[1][1] == "" and "" or "]" end, 1, {}),
                i(2, "package")
            },
            {}
        ),
        {}
    ),
    s(
        {
            trig = "table",
            dscr = "Table environment",
            -- snippetType = "snippet".
            priority = 100,
        },
        fmta([[
            \begin{table}[<>]
                \centering
                \caption{<caption>}
                \label{tab:<label>}
                \begin{tabular}{<>}
                    <>
                \end{tabular}
            \end{table}
        ]], { i(1), caption = i(2), label = i(3), i(4), i(0) }, {}),
        {}
    ),
    as(
        {
            trig = "itm",
            dscr = "A new item",
            hidden = true,
            -- priority = ,
        },
        {
            t("\\item")
        },
        {}
    ),
    as(
        {
            trig = "fig",
            dscr = "Figure environment",
        },
        fmta([[
            \begin{figure}[<>]
                \centering
                <opts>{<figure>}
                \caption{<capt>}
                \label{fig:<>}

            \end{figure}
        ]] -- \label{fig:${5:${3/\W+/-/g}}} corregir jerga ultisnips

        , { i(1), opts = i(2, "\\includegraphics[width=0.8\textwidth]"), figure = i(3), capt = i(4), rep(3) }, {}),
        {}
    ),
    s({ trig = '([^%a])ff', regTrig = true, wordTrig = false },
        fmta(
            [[<>\frac{<>}{<>}]],
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2)
            }
        )
    ),
    s(
        { trig = "enum", name = "Enumerate", dscr = "Enumerate environment", },
        fmta("\\begin{enumerate}<><><>\n\t<>\n\\end{enumerate}",
            {
                f(function(args, _, _) return args[1][1] == "" and "" or "[label=\\" end, 1, {}),
                i(1, "alph*)"),
                f(function(args, _, _) return args[1][1] == "" and "" or "]" end, 1, {}),
                i(2),
            },
            {}
        ),
        {}
    ),
    as(
        {
            trig ="hmk",
            dscr = "New homework problem",
        },
        fmta("\\begin{homeworkProblem}\n\t<>\n\\end{homeworkProblem}",{i(1)},{}),
        {}
    ),
}

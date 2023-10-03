local ls = require("luasnip")
local s = ls.snippet
local as = require "luasnip.util.extend_decorator".apply(s, { snippetType = "autosnippet" })
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
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


-- The `ìn_mathzone` function requires the VimTeX plugin
local function in_mathzone()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

    as("dm", { t "\\[ ", i(1), t " \\]" }),
    as("mk", { t "\\( ", i(1), t " \\)" }),
    as("prbl", fmta("\\problem{<>}{<>}", { i(1), i(2) }, {}), {}),

    as(";a", { t("\\alpha") }),
    as(";b", { t("\\beta") }),
    as(";g", { t("\\gamma") }),
    as("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),

    -- Solo deberían desencadenarse si no hay carácteres detrás
    as("!=", t("\\neq")),
    as("<=", t("\\le")),
    as(">=", t("\\ge")),
    as("dd", { t "\\dd{", i(1), t "}" }),
    -- as({ trig = "sin|cos|tan|arccot|cot|csc|ln|log|exp|star|perp", regTrig = true },
    --     f(function(_, snip)
    --         return snip.captures[1] .. "(alan)"
    --     end), {}),   -- Lua does not support alternate matches

    as({ trig = "cos" }, { t "\\cos(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "sin" }, { t "\\sin(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "tan" }, { t "\\tan(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "cot" }, { t "\\cot(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "csc" }, { t "\\csc(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "arccot" }, { t "\\arccot(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "ln" }, { t "\\ln(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "log" }, { t "\\log(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "exp" }, { t "\\exp(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "star" }, { t "\\star(", i(1), t ")" }, { condition = in_mathzone }),
    as({ trig = "perp" }, { t "\\perp(", i(1), t ")" }, { condition = in_mathzone }),

    -- Solo en contexto matemático
    as("EE", t("\\exists")),
    as("AA", t "\\forall"),
    as("xnn", t "x_{n}"),
    as("ynn", t "y_{n}"),
    as("xii", t "x_{i}"),
    as("yii", t "y_{i}"),
    as("xjj", t "x_{j}"),
    as("yjj", t "y_{j}"),

    -- as("int", { t "\\int{", i(1), t "}" }, { condition = in_mathzone }),
    as("fx", { t "f(x)", condition = in_mathzone }),

}

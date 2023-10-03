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
-- local ms = ls.multi_snippet

return {
    s(
        {
            trig = "init",
            dscr = "Init template",
        },
        fmta([[
	        cmake_minimum_required(VERSION <>)
	        project(<>)

	        find_package(<>)

	        include_directories(<>_INCLUDE_DIRS)

	        add_subdirectory(<>)

	        add_executable(<>)

	        target_link_libraries(<> <>_LIBRARIES)

        ]], { i(1, "2.8.2"), rep(2), i(3, "library"), rep(3), i(0, "src"), i(2, "ProjectName"), rep(2), rep(3) }, {}),
        {}
    ),
    s("proj", { t "project(", i(1, "Name"), t ")" }),
    s("min", { t "cmake_minimum_required( VERSION", i(0, "2.8.2"), t ")" }),
    s("include", { t "include_directories(", i(0, "include_dir"), t ")" }),
    s("find", { t "find_package(", i(1, "library"), i(0, " REQUIRED"), t ")" }),
    s("glob", fmta("file(glob <> *.<>)", { i(1, "srcs"), i(0, "cpp") }, {}), {}),
    s("subdir", { t "add_subdirectory(", i(0, "src"), t ")" }),
    s("lib", fmta("add_library(<> ${<>}", { i(1, "lib"), i(0, "srcs") }, {}), {}),
    s("link", { t "target_link_libraries(", i(1, "bin"), i(0, " somelib"), t ")" }),
    s("bin", { t "add_executable(", i(1, "bin"), t ")" }),
    s("set", { t "set(", i(1, "var"), t " ", i(0, "val"), t ")" }),
    s("dep", fmta("add_dependencies(<>\n<>\n)", { i(1, "target"), i(0, "dep") }, {}), {}),
    as("Ext_url",
        fmta([[
         include(ExternalProject)
         ExternalProject_Add(<>
           URL <>
           URL_HASH SHA1=<>
           SOURCE_DIR "<>"
           BINARY_DIR "<>"
           CONFIGURE_COMMAND ""
           BUILD_COMMAND     ""
           INSTALL_COMMAND   ""
           TEST_COMMAND      ""
         )
            ]],
            { i(1, "googletest"),
                i(2, "http://googletest.googlecode.com/files/gtest-1.7.0.zip"),
                i(3, "f85f6d2481e2c6c4a18539e391aa4ea8ab0394af"),
                i(4, "${CMAKE_BINARY_DIR}/gtest-src}"),
                i(0, "${0:${CMAKE_BINARY_DIR}/gtest-build}")
            },
            {}
        ),
        {}
    ),
    s(
        "Ext_git",
        fmta([[
             include(ExternalProject)
             ExternalProject_Add(<>
               GIT_REPOSITORY    <>
               GIT_TAG           <>
               SOURCE_DIR        "<>"
               BINARY_DIR        "<>"
               CONFIGURE_COMMAND ""
               BUILD_COMMAND     ""
               INSTALL_COMMAND   ""
               TEST_COMMAND      ""
             )
         ]],
            {
                i(1, "googletest"),
                i(2, "https://github.com/google/googletest.git"),
                i(3, "master"),
                i(4, "${CMAKE_BINARY_DIR}/googletest-src"),
                i(0, "${CMAKE_BINARY_DIR}/googletest-build")
            },
            {}
        ),
        {}
    ),
    s("props",
        fmta(
            [[
             set_target_properties(<>
              <> <>
              <>
             )
            ]],
            { i(1, "target"), i(2, "properties"), i(3, "compile_flags"), i(0, "-O3 -Wall -pedantic") },
            {}
        ),
        {}
    ),
    s("test", { t "add_test(", i(1, "ATestName"), t " ", i(0, "testCommand --options"), t ")" }),
}

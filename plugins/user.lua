return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    'lervag/vimtex',
    opt = true,
    config = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_general_viewer = 'zathura'
      -- vim.g.tex_comment_nospell = 1
      -- vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      -- vim.g.vimtex_view_general_options_latexmk = '--unique'
      -- vim.g.vimtex_syntax_enabled = 1
      -- vim.g.vimtex_indent_enabled = 1
    end,
    ft = 'tex'
  },
  {
    "L3MON4D3/LuaSnip",
    opts = {
      enable_autosnippets = true,
      update_events = "TextChangedI",
    },
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts)                                                 -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_lua").lazy_load { paths = { "~/.config/nvim/lua/user/snippets" } } -- load snippets paths
    end,
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    config = function()
      require("luasnip-latex-snippets").setup()
    end,
    ft = { "tex", "markdown" },
  },
  {
    'Mofiqul/vscode.nvim',
    opts = {
    },
    config = function()
      vim.o.background = 'dark'
      require("vscode").setup({
        -- transparent = true,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },
        group_overrides = {
          Cursor = {
            fg = require("vscode.colors").get_colors().vscDarkBlue,
            bg = require("vscode.colors").get_colors().vscLightGreen,
            bold = true
          }
        }
      })
      require("vscode").load()
    end,
  },
  {
    'arzg/vim-colors-xcode',
    opts = {

    },
    config = function()
    end
  },
  {
    'tomasiser/vim-code-dark'
  }

  --include luasnip-vimtex-snippets
  -- 1 ada 1
}

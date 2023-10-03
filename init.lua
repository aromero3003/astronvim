return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    config = {
      clangd = {
        capabilities = { offsetEncoding = "utf-8" }
      }
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  icons = {
    MacroRecording = "",
    ActiveLSP = "",
    ActiveTS = "綠",
    BufferClose = "",
    NeovimClose = "",
    DefaultFile = "",
    Diagnostic = "裂",
    DiagnosticError = "",
    DiagnosticHint = "",
    DiagnosticInfo = "",
    DiagnosticWarn = "",
    Ellipsis = "…",
    FileModified = "",
    FileReadOnly = "",
    FolderClosed = "",
    FolderEmpty = "",
    FolderOpen = "",
    Git = "",
    GitAdd = "",
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "◌",
    GitRenamed = "➜",
    GitStaged = "✓",
    GitUnstaged = "✗",
    GitUntracked = "★",
    LSPLoaded = "",
    LSPLoading1 = "",
    LSPLoading2 = "",
    LSPLoading3 = "",
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    --
    --   vim.cmd([[if !exists("g:vim_window_id")
    --       let g:vim_window_id = system("xdotool getactivewindow")
    --     endif]]
    --   )
    --   vim.cmd([[
    --   function! s:TexFocusVim() abort
    -- " Give window manager time to recognize focus moved to Zathura;
    -- " tweak the 200m as needed for your hardware and window manager.
    --       sleep 200m
    -- " Refocus Vim and redraw the screen
    --       silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
    --       redraw!
    --     endfunction
    --   ]])
    --   vim.cmd([[
    --       augroup vimtex_event_focus
    --         au!
    --         au User VimtexEventView call s:TexFocusVim()
    --       augroup END
    --   ]])
    -- local augroup = vim.api.nvim_create_augroup("VimtexGroup", { clear = true })
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "VimtexEventInitPost",
    --   group = augroup,
    --   command = "VimtexCompile",
    -- })
    -- vim.api.nvim_create_autocmd("FileType", {
    --   desc = "C/C++ tabbing",
    --   pattern = { "c", "cpp" },
    --   callback = function() astronvim.user_opts { opt = { shiftwidth = 0, tabstop = 4 } } end,
    -- })

    require("luasnip").config.set_config({
      enable_autosnippets = true,
      update_events = "TextChangedI,TextChanged"
    })

    -- require("vscode").load("dark")
    -- vim.cmd("colorscheme xcodedarkhc")
    vim.cmd("colorscheme codedark")

    -- vim.cmd("hi texCmd guifg=#ad3da4 guibg=NONE gui=NONE ctermfg=127 ctermbg=NONE cterm=NONE")
    -- vim.cmd("hi! link texMathEnvArgName texEnvArgName")
    -- vim.cmd("hi! link texMathZone LocalIdent")
    -- vim.cmd("hi! link texMathZoneEnv texMathZone")
    -- vim.cmd("hi! link texMathZoneEnvStarred texMathZone")
    -- vim.cmd("hi! link texMathZoneX texMathZone")
    -- vim.cmd("hi! link texMathZoneXX texMathZone")
    -- vim.cmd("hi! link texMathZoneEnsured texMathZone")
    -- vim.cmd("hi! link QuickFixLine Normal")
    -- vim.cmd("hi! link qfLineNr Normal")
    -- vim.cmd("hi! link EndOfBuffer LineNr")
    -- vim.cmd("hi! link Conceal LocalIdent")
  end,
  vim.cmd("set clipboard+=unnamedplus")
}

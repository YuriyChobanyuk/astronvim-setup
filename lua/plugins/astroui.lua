-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
local pastel = {
  red = "#ff746c",
  green = "#badba2",
  yellow = "#ffee8c",
}

local atom = {
  white =  "#abb2bf",
  cyan = "#56b6c2"
}

local custom = {
  grey = "#9999bb",
  accent = "#cce197",
  hl = "#3e80b5",
  white = "#f3f3f3",
  dark = "#353540",
  black = "#020202"
}

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        Normal = {},
        DiagnosticUnderlineError = {
          underline = true,
          sp = pastel.red,
        },
        DiagnosticUnderlineWarn = {
          underline = true,
          sp = pastel.yellow,
        },
        DiagnosticUnderlineHint = {
          underline = true,
          sp = pastel.green,
        },
      },
      astrodark = {
        Comment = {
          fg = custom.grey,
          italic = true,
        },
        LineNr = {
          fg = custom.grey,
        },
        CursorLineNr = {
          fg = custom.accent,
          bold = true,
        },
        Visual = {
          bg = custom.hl,
          fg = custom.white,
        },
        CursorLine = {
          bg = custom.dark,
        },
        CurSearch = {
          bg = custom.accent,
          fg = custom.black,
        },
        IncSearch = {
          bg = custom.accent,
          fg = custom.black,
        },
        Search = {
          fg = custom.accent,
          underline = true,
        },
        ["@field"] = {
          fg = atom.white,
        },
        ["@property"] = {
          fg = atom.white,
        },
        ["@interface"] = {
          fg = atom.cyan,
        },
        Constant = {
          fg = atom.white,
        },
        ["@punctuation.delimiter"] = {
          bold = true,
          fg = atom.white
        },
        DiffAdd = {
          fg = pastel.green,
        },
        DiffDelete = {
          fg = pastel.red,
        },
        DiffChange = {
          fg = pastel.yellow,
        },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

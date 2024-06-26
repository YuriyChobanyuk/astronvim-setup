-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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
      },
      astrodark = {
        Comment = {
          fg = "#9999bb",
          italic = true,
        },
        LineNr = {
          fg = "#9999bb",
        },
        CursorLineNr = {
          fg = "#cce197",
          bold = true
        },
        Visual = {
          bg = "#3e80b5",
          fg = "#f3f3f3",
        },
        CursorLine = {
          bg = "#353540",
        },
        CurSearch = {
          bg = "#cce197",
          fg = "#020202",
        },
        IncSearch = {
          bg = "#cce197",
          fg = "#020202",
        },
        Search = {
          fg = "#cce197",
          underline = true
        },
        ["@field"] = {
          fg = "#abb2bf",
        },
        ["@property"] = {
          fg = "#abb2bf",
        },
        ["@interface"] = {
          fg = "#56b6c2"
        },
        Constant = {
          fg = "#abb2bf"
        }
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

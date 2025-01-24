-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- TODO: check snippets
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"

      opts.mapping["<C-l>"] = cmp.mapping.complete { reason = "manual" }
      -- required for neovide
      opts.mapping["<D-l>"] = cmp.mapping.complete { reason = "manual" }
    end,
    config = function(plugin, opts)
      require "astronvim.plugins.configs.cmp"(plugin, opts)

      local cmp = require "cmp"

      cmp.setup {
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
          keyword_length = 0,
        },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    ---@diagnostic disable-next-line: missing-fields
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "ckolkey/ts-node-action",
    config = function() require("ts-node-action").setup {} end,
  },
  {
    "David-Kunz/jester",
    config = function()
      require("jester").setup {
        cmd = 'jest -t "$result"',
      }
    end,
  },
  {
    {
      "LukasPietzschmann/telescope-tabs",
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("telescope").load_extension "telescope-tabs"
        require("telescope-tabs").setup {
          -- Your custom config :^)
        }
      end,
    },
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require "multicursor-nvim"

      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      set({ "n", "v" }, "<up>", function() mc.lineAddCursor(-1) end)
      set({ "n", "v" }, "<down>", function() mc.lineAddCursor(1) end)
      set({ "n", "v" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
      set({ "n", "v" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "v" }, "<leader>nn", function() mc.matchAddCursor(1) end)
      set({ "n", "v" }, "<leader>ns", function() mc.matchSkipCursor(1) end)
      set({ "n", "v" }, "<leader>nN", function() mc.matchAddCursor(-1) end)
      set({ "n", "v" }, "<leader>nS", function() mc.matchSkipCursor(-1) end)

      -- Add all matches in the document
      set({ "n", "v" }, "<leader>nA", mc.matchAllAddCursors)

      -- You can also add cursors with any motion you prefer:
      -- set("n", "<right>", function()
      --     mc.addCursor("w")
      -- end)
      -- set("n", "<leader><right>", function()
      --     mc.skipCursor("w")
      -- end)

      -- Rotate the main cursor.
      set({ "n", "v" }, "<left>", mc.nextCursor)
      set({ "n", "v" }, "<right>", mc.prevCursor)

      -- Delete the main cursor.
      set({ "n", "v" }, "<leader>nx", mc.deleteCursor)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)

      -- Easy way to add and remove cursors using the main cursor.
      set({ "n", "v" }, "<c-q>", mc.toggleCursor)

      set("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)

      -- bring back cursors if you accidentally clear them
      set("n", "<leader>nX", mc.restoreCursors)

      -- Append/insert for each line of visual selections.
      set("v", "I", mc.insertVisual)
      set("v", "A", mc.appendVisual)

      -- match new cursors within visual selections by regex.
      set("v", "M", mc.matchCursors)

      -- Jumplist support
      set({ "v", "n" }, "<c-i>", mc.jumpForward)
      set({ "v", "n" }, "<c-o>", mc.jumpBackward)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}

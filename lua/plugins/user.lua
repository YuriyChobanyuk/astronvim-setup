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
}

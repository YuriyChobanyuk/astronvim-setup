-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local function assign(tbl, props)
  for k, v in pairs(props) do
    tbl[k] = v
  end
end

local hopMappings = {
  ["<Leader>s"] = { function() require("hop").hint_char {} end },
  ["<Leader>S"] = { function() require("hop").hint_char2 {} end },
}

local astroMappings = {
  ["<Leader>a"] = { desc = "Astro Update" },
  ["<Leader>ai"] = { function() require("lazy").install() end, desc = "Plugins Install" },
  ["<Leader>as"] = { function() require("lazy").home() end, desc = "Plugins Status" },
  ["<Leader>aS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" },
  ["<Leader>au"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" },
  ["<Leader>aU"] = { function() require("lazy").update() end, desc = "Plugins Update" },

  -- AstroNvim
  ["<Leader>aa"] = { "<cmd>AstroUpdatePackages<cr>", desc = "Update Plugins and Mason Packages" },
  ["<Leader>aA"] = { "<cmd>AstroUpdate<cr>", desc = "AstroNvim Update" },
  ["<Leader>av"] = { "<cmd>AstroVersion<cr>", desc = "AstroNvim Version" },
  ["<Leader>al"] = { "<cmd>AstroChangelog<cr>", desc = "AstroNvim Changelog" },
}

local commonMappings = {
  ["U"] = { "<C-r>", desc = "Redo" },
  ["<Leader>y"] = { '"+y', desc = "Yank to System clipboard" },
  ["<Leader>p"] = { '"+p', desc = "Paste from System clipboard" },
  ["gb"] = { "<C-O>", desc = "Go back" },
  ["gf"] = { "<C-I>", desc = "Go forward" },
  ["q"] = { "" },
  K = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
}

local telescopeMappings = {

  ["<Leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore", "-w" }) end,
      }
    end,
    desc = "Find words in all files",
  },
  ["<Leader>fv"] = { function() require("telescope.builtin").treesitter() end, desc = "Search variables" },
}

local neotreeMappings = {
  ["<Leader>kk"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  ["<Leader>kl"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  },
}

local gitsignsMappings = {
  ["<Leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
  ["<Leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
  ["<Leader>gh"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" },
}

local tabMappings = {
  ["<C-`>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  ["<Leader>tc"] = { function() vim.cmd.tabclose() end, desc = "Close tab" },
  ["<Leader>tn"] = { function() vim.cmd.tabnew() end, desc = "New tab" },
  ["<Leader>tt"] = {
    function()
      vim.cmd.tabnew()
      vim.cmd.terminal()
    end,
    desc = "New terminal",
  },
}

local mappings = {
  -- first key is the mode
  n = {
    ["<Leader>h"] = false,
    ["<Leader>/"] = false,
  },
  v = {
    ["<Leader>h"] = false,
  },
  t = {
    ["<C-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
}

assign(mappings.n, commonMappings)
assign(mappings.n, hopMappings)
assign(mappings.n, telescopeMappings)
assign(mappings.n, gitsignsMappings)
assign(mappings.n, neotreeMappings)
assign(mappings.n, tabMappings)
assign(mappings.n, astroMappings)

assign(mappings.v, commonMappings)
assign(mappings.v, hopMappings)

return mappings

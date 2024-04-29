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

local get_icon = require("astroui").get_icon

local hopMappings = {
  ["<Leader>s"] = { function() require("hop").hint_patterns {} end, desc = "Hop" },
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
  ["<Leader>fv"] = { function() require("telescope.builtin").treesitter() end, desc = "Find variables" },
  ["<Leader>fH"] = { function() require("telescope.builtin").highlights() end, desc = "Find highlights" },
  ["<Leader>/"] = { "<cmd>noh<CR>", desc = "Noh" },
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
  ["<Leader>k]"] = { "<cmd>vertical resize +20<CR>", desc = "increase pane width" },
  ["<Leader>k["] = { "<cmd>vertical resize -20<CR>", desc = "decrease pane width" },
  ["<Leader>k{"] = { "<cmd>horizontal resize -20<CR>", desc = "increase tree height" },
  ["<Leader>k}"] = { "<cmd>horizontal resize +20<CR>", desc = "decrease tree height" },
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
  ["<Leader>t]"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
  ["<Leader>t["] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
}

local navigationMappings = {
  ["[e"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" },
  ["]e"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
  ["]t"] = {
    function() require("astrocore.buffer").nav(vim.v.count1) end,
    desc = "Next buffer",
  },
  ["[t"] = {
    function() require("astrocore.buffer").nav(-vim.v.count1) end,
    desc = "Previous buffer",
  },
}

local packageMappings = {
  ["<Leader>P"] = { desc = get_icon("Package", 1, true) .. "Packages" },
  ["<Leader>Pi"] = { function() require("lazy").install() end, desc = "Plugins Install" },
  ["<Leader>Ps"] = { function() require("lazy").home() end, desc = "Plugins Status" },
  ["<Leader>PS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" },
  ["<Leader>Pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" },
  ["<Leader>PU"] = { function() require("lazy").update() end, desc = "Plugins Update" },
  ["<Leader>Pa"] = { function() require("astrocore").update_packages() end, desc = "Update Lazy and Mason" },
  ["<Leader>Pm"] = { function() require("mason.ui").open() end, desc = "Mason Installer" },
  ["<Leader>PM"] = { function() require("astrocore.mason").update_all() end, desc = "Mason Update" },
}

local bufferMappings = {
  ["<Leader>x"] = { desc = "Buffer mappings" },
  ["<Leader>xw"] = { function() require("astrocore.buffer").close() end, desc = "Close all buffers except current" },
  ["<Leader>xt"] = { "<cmd>e#<CR>", desc = "Reopen closed buffer" },
}

local testingMappings = {
  ["<Leader>m"] = { desc = "Testing" },
  ["<Leader>ma"] = { function() require("neotest").run.run() end, desc = "Run current test suite" },
  ["<Leader>mf"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run current test file" },
  ["<Leader>md"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug current test suite" },
  ["<Leader>ms"] = { function() require("neotest").run.stop() end, desc = "Stop test" },
  ["<Leader>mA"] = { function() require("neotest").run.attach() end, desc = "Attach to the nearest test" },
  ["<Leader>mr"] = { function() require("neotest").summary.open() end, desc = "Test results" },
  ["<Leader>mR"] = { function() require("neotest").summary.close() end, desc = "Close test results" },
}

local toolsMappings = {
  ["<Leader>a"] = { desc = "Tools mappings" },
  ["<Leader>ad"] = { "<cmd>Trouble diagnostics focus filter.buf=0<cr>", desc = "Trouble Buffer" },
  ["<Leader>aD"] = { "<cmd>Trouble diagnostics focus<cr>", desc = "Trouble Global" },
  ["<Leader>al"] = { "<cmd>Trouble lsp focus<cr>", desc = "Trouble lsp" },
  ["<Leader>ac"] = { "<cmd>Trouble close<cr>", desc = "Trouble close" },
  ["<Leader>aa"] = { "<cmd>AerialOpen<cr>", desc = "Aerial Open" },
  ["<Leader>ax"] = { "<cmd>AerialClose<cr>", desc = "Aerial Close" },
}

local mappings = {
  -- first key is the mode
  n = {},
  v = {},
  t = {
    ["<C-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
  i = {
    ["<C-l>"] = { function() require("cmp").mapping.complete() end },
  },
}

assign(mappings.n, commonMappings)
assign(mappings.n, hopMappings)
assign(mappings.n, telescopeMappings)
assign(mappings.n, gitsignsMappings)
assign(mappings.n, neotreeMappings)
assign(mappings.n, tabMappings)
assign(mappings.n, navigationMappings)
assign(mappings.n, packageMappings)
assign(mappings.n, bufferMappings)
assign(mappings.n, testingMappings)
assign(mappings.n, toolsMappings)

assign(mappings.v, commonMappings)
assign(mappings.v, hopMappings)

return mappings

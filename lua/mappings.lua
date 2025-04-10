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
  ["K"] = { function() vim.lsp.buf.hover() end, desc = "Hover diagnostics" },
  ["L"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature help" },
}

local telescopeMappings = {
  ["<Leader>fw"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore", "-w" }) end,
      }
    end,
    desc = "Find words in all files",
  },
  ["<Leader>fv"] = { function() require("telescope.builtin").treesitter() end, desc = "Find variables" },
  ["<Leader>fH"] = { function() require("telescope.builtin").highlights() end, desc = "Find highlights" },
  ["<Leader>fO"] = { function() require("telescope-tabs").list_tabs() end, desc = "Find tabs" },
  ["<Leader>fr"] = {
    function() require("telescope.builtin").lsp_references { search = vim.fn.expand "<cword>" } end,
    desc = "Find references",
  },
  ["<Leader>fR"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },
  ["<Leader>fW"] = {
    function() require("telescope.builtin").grep_string { search = vim.fn.expand "<cword>" } end,
    desc = "Find words",
  },
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
  ["<Leader>tx"] = { function() vim.cmd.tabclose() end, desc = "Close tab" },
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

local panelMappings = {
  ["<Leader>x"] = { desc = "Panels" },
  ["<Leader>xw"] = { function() require("astrocore.buffer").close() end, desc = "Close all buffers except current" },
  ["<Leader>xt"] = { "<cmd>e#<CR>", desc = "Reopen closed buffer" },
  ["<Leader>xh"] = { "<cmd>noh<CR>", desc = "Noh" },
  ["<Leader>xa"] = { "<cmd>AerialClose<cr>", desc = "Close Aerial" },
}

local visualSpecific = {
  ["<Leader>fw"] = {
    function()
      local text = vim.fn.getreg '"'
      require("telescope.builtin").grep_string()
    end,
    desc = "Search selected text",
  },
}

local mappings = {
  -- first key is the mode
  n = {
    ["<Leader>n"] = { "", desc = "Multicursor" },
  },
  v = {},
  t = {
    ["<D-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<C-S-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<C-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
  i = {
    ["<C-l>"] = { function() require("cmp").mapping.complete() end },
    ["<D-l>"] = { function() require("cmp").mapping.complete() end },
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
assign(mappings.n, panelMappings)

assign(mappings.v, commonMappings)
assign(mappings.v, hopMappings)
assign(mappings.v, visualSpecific)

return mappings

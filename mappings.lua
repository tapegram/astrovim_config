-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- Rebind Comment to ; from / 
    ["<leader>/"] = false,
    ["<leader>;"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Comment line",
    },

    -- Easy bind to "go back" (to previous buffer)
    -- Based on my muscle memory
    ["<leader><tab>"] = { 
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- Rebind Find Theme to Ts
    ["<leader>ft"] = false,
    ["<leader>T"] = { name = "Toggle" },
    ["<leader>Ts"] =
    { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" },

    -- Shortcut for LSP code actions
    ["<leader>."] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },

    -- Show signature help
    ["<leader>lh"] = {
      function() vim.lsp.buf.signature_help() end,
      desc = "Signature help",
    },

    -- show hover info (hopefully type)
    ["<leader>lt"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Show type",
    },

    -- Diagnostic for buffer
    ["<leader>lE"] = {
      function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end,
      desc = "Show diagnostics in buffer"
    },
    -- Telescope for .git project
    -- https://github.com/nvim-telescope/telescope.nvim/issues/592#issuecomment-789002966
    -- Gave spacemacs keybinding for muscle memory reasons.
    ["<leader>pf"] = { 
      function(opts)
        opts = opts or {}
        opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        require'telescope.builtin'.find_files(opts)
      end,
      desc = "Find file in project",
    },
    -- Telescope
    -- Trying to get something similar to swiper -- basically telescope for the current buffer
    -- Using spacemacs keybding for msucle memory.
    -- https://www.reddit.com/r/neovim/comments/prs0zr/comment/hdlb3dk/?utm_source=share&utm_medium=web3x
    -- https://github.com/nvim-telescope/telescope.nvim/issues/762#issuecomment-933036711
    ["<leader>s"] = { name = "search" },
    ["<leader>ss"] = {
      function() require('telescope.builtin').current_buffer_fuzzy_find({fuzzy=true, case_mode=ignore_case}) end,
      desc = "Search in buffer"
    },
    -- Telescope
    -- Look up buffers!
    ["<leader>bb"] = false,
    ["<leader>bb"] = {
      function() require('telescope.builtin').buffers({fuzzy=true, case_more=ignore_case}) end,
      desc = "Recent buffers"
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    -- Rebind Comment to ; from / 
    ["<leader>/"] = false,
    ["<leader>;"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line"
    },
    -- Shortcut for LSP code actions
    ["<leader>."] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
  }
}

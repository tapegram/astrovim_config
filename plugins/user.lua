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
  -- Attempting to switch to neogit but failed. Leaving the attempt here for future me's reference
  -- {
  --   "TimUntersberger/neogit",
  --   config = function()
  --     require("nvim-lua/plenary.nvim").setup()
  --   end,
  -- }
  -- Themes
  { "catppuccin/nvim", name = "catppuccin"},
  { "rebelot/kanagawa.nvim", name = "kanagawa"},
  { "savq/melange-nvim", name = "melange"},
  { "EdenEast/nightfox.nvim", name = "nightfox"},
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic'.load()
    end
  },
  { 
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },

}

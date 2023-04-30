return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  
  { import = "astrocommunity.colorscheme.nightfox"},
  { import = "astrocommunity.colorscheme.kanagawa"},
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  -- { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.gruvbox" },
  
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}

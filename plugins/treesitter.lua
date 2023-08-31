return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- ensure_installed = { "lua" },
  },
  lazy = false,
  config = function()
    vim.filetype.add { extension = { u = "unison" } }
    require("nvim-treesitter.parsers").get_parser_configs().unison = { 
      install_info = {
        url = "~/projects/tree-sitter-unison",
        files = { "src/parser.c", "src/scanner.c", "src/maybe.c" },
        branch = "main",
      },
    }
  end,
}

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
    { -- https://github.com/Verf/deepwhite.nvim
        'Verf/deepwhite.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme deepwhite]]
        end,
    },
    {
	    "L3MON4D3/LuaSnip",
	    build = "make install_jsregexp",
	    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/projects/snippets" } })
        -- https://github.com/L3MON4D3/LuaSnip/issues/850#issuecomment-1837184505
        -- wallchart_snippets = function()
        --   require("luasnip.loaders.from_vscode").load_standalone({path = vim.fn.getcwd() .. "/.vscode/snippets.code-snippets", lazy = true})
        -- end
        -- pcall(wallchart_snippets)
      end
    },
    { "sainnhe/everforest", name = "everforest"},
    { 
      "unisonweb/unison",
      branch = "trunk",
      config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/editor-support/vim")
        require("lazy.core.loader").packadd(plugin.dir .. "/editor-support/vim")

        -- This function is for configuring a buffer when an LSP is attached
        local on_attach = function(client, bufnr)
          -- Always show the signcolumn, otherwise it would shift the text each time
          -- diagnostics appear/become resolved
          vim.o.signcolumn = 'yes'

          -- Update the cursor hover location every 1/4 of a second
          vim.o.updatetime = 250

          -- Disable appending of the error text at the offending line
          vim.diagnostic.config({virtual_text=false})

          -- Enable a floating window containing the error text when hovering over an error
          vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
              local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
              }
              vim.diagnostic.open_float(nil, opts)
            end
          })

          -- This setting is to display hover information about the symbol under the cursor
          vim.keymap.set('n', 'K', vim.lsp.buf.hover)

        end

        -- Setup the Unison LSP
        require('lspconfig')['unison'].setup{
            on_attach = on_attach,
        }

        -- This is NVim Autocompletion support
        local cmp = require 'cmp'

        -- This function sets up autocompletion
        cmp.setup {

          -- This mapping affects the autocompletion choices menu
          mapping = cmp.mapping.preset.insert(),

          -- This table names the sources for autocompletion
          sources = {
            { name = 'nvim_lsp' },
          },
        }
      end,
      init = function(plugin)
        require("lazy.core.loader").ftdetect(plugin.dir .. "/editor-support/vim")
      end,
    }
}

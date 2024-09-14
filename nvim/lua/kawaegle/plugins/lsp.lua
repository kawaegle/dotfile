return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x'
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  {
    'neovim/nvim-lspconfig',
    event = {'BufReadPre', 'BufNewFile'},
    cmd = {'LspInfo', 'LspInstall', 'LspStart', 'LspStop'},
    dependencies = {
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local lsp_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "open on floating diagnostic"
        vim.keymap.set("n", "<C-M-space>", function() vim.diagnostic.open_float() end, opts)
      end

      lsp_zero.extend_lspconfig({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        lsp_attach = lsp_attach,
        float_border = 'rounded',
        sign_text = true,
      })

      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        }
      })


      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          "clangd",
          "dockerls",
          "gopls",
          "jsonls",
          "pyright",
          "docker_compose_language_service",
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          ["volar"] = function() end,
          ["ts_ls"] = function() end,
        },
      })

      local lspconf = require("lspconfig")
      local vue_language_server_path = require("mason-registry").get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

lspconf.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
lspconf.volar.setup({})

    end
  }
}

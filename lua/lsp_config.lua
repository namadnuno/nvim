local lsp = require'lspconfig'

local lsp_status = require('lsp-status')

local on_attach = function(client)
  require'completion'.on_attach(client)
  lsp_status.on_attach(client)

  local options = {
    noremap = true,
    silent = true
  }

  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
  vim.api.nvim_set_keymap('n', 'K',     '<cmd>lua vim.lsp.buf.hover()<CR>', options)
  vim.api.nvim_set_keymap('n', 'gD',    '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
  vim.api.nvim_set_keymap('n', '1gD',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
  vim.api.nvim_set_keymap('n', 'gr',    '<cmd>lua vim.lsp.buf.references()<CR>', options)
  vim.api.nvim_set_keymap('n', 'g0',    '<cmd>lua vim.lsp.buf.document_symbol()<CR>', options)
  vim.api.nvim_set_keymap('n', 'gW',    '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', options)
  vim.api.nvim_set_keymap('n', 'ge',    '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
  vim.api.nvim_set_keymap('n', '<c-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
  vim.api.nvim_set_keymap("n", "<c-A>", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    options)
  vim.api.nvim_set_keymap("n", "<c-N>", "<cmd>lua vim.lsp.buf.rename()<CR>",
    options)
  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
end


-- general diagnostic server
lsp.diagnosticls.setup{
  on_attach = on_attach,
  filetypes={ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint',
        rootPatterns = { '.git' },
        debounce = 10,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
    },
    filetypes = {
      javascript = 'eslint',
      typescript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
      vue = 'eslint'
    },
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filepath', '--single-quote', '--print-width 100' },
        doesWriteToFile = true,
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      typescript = 'prettier',
      javascriptreact = 'prettier',
      typescriptreact = 'prettier'
    },
  }
}

-- typescript
lsp.tsserver.setup{
  on_attach = on_attach
}

-- vue
lsp.vuels.setup{
  on_attach = on_attach
}
--
-- css
lsp.cssls.setup{
  on_attach = on_attach
}

lsp.intelephense.setup{
  on_attach = on_attach,
  
  settings = {
    intelephense = {
      format = {
        enable = true,
      } 
    }
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}


lsp_status.register_progress()

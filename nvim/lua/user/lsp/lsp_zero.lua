local ok, lsp = pcall(require, "lsp-zero")
if not ok then
    return
end
lsp.preset('lsp-compe')
lsp.setup()
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '',
    hint = '⚑',
    info = ''
  }
})


vim.diagnostic.config({
  virtual_text = false
})

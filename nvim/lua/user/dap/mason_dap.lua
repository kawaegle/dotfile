local ok, mason_dap = pcall(require, "mason-nvim-dap")

if not ok then
    return
end

mason_dap.setup({
    ensure_installed = {"cpptools", "bash-debug-adapter", "debugpy"},
    automatic_setup = true,
    automatic_installation = true,
})

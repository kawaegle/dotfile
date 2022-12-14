local ok, mason = pcall(require, "mason")
local ok2, mason_config = pcall(require, "mason-lspconfig")

if not ok or not ok2 then
    return
end

mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_config.setup({
    ensure_installed = {"pyright", "clangd", "diagnosticls", "cmake", "bashls"},
    automatic_installation = true,
})

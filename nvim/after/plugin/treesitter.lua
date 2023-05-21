local status_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_treesitter then
    return
end

treesitter.setup {
    ensure_installed = {
        "c",
        "cpp",
        "bash",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "json",
        "markdown",
        "python",
        "lua",
        "query"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

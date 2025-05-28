return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    local icons = require("nvim-web-devicons")

    icons.setup({
      default = true,
      strict = true,
      color_icons = true,
      override = {
        gql = {
          icon = "",
          color = "#e535ab",
          cterm_color = "199",
          name = "GraphQL",
        },
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
      },
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
        ["makefile"] = {
          icon = "",
          color = "#F0524F",
          cterm_color = "65",
          name = "MakeFile",
        },
      },
    })
  end,
}

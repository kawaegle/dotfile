return {
  {
    "ten3roberts/qf.nvim",
    config = function()
      local qf = require("qf")
      qf.setup({
        l = {
          auto_close = true,
          auto_follow = 'prev',
          auto_follow_limit = 8,
          follow_slow = true,
          auto_open = true,
          auto_resize = true,
          max_height = 8,
          min_height = 5,
          wide = false,
          number = true,
          relativenumber = false,
          unfocus_close = false,
          focus_open = false,
        },

        c = {
          auto_close = true,
          auto_follow = 'prev',
          auto_follow_limit = 8,
          follow_slow = true,
          auto_open = true,
          auto_resize = true,
          max_height = 8,
          min_height = 5,
          wide = false,
          number = true,
          relativenumber = false,
          unfocus_close = false,
          focus_open = false,
        },
        close_other = false,
        pretty = true,
        silent = false,
      })
    end
  }
}

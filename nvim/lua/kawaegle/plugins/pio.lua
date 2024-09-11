local function fileExists(filename)
  local f = io.open(filename, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function check_platformio()
  -- Get the current working directory
  local current_pwd = vim.fn.getcwd()

  -- Define the file path to check
  local target_file = current_pwd .. "/platformio.ini"

  -- Check if the file exists
  if fileExists(target_file) then
    return true
  else
    return false
  end
end

return {
  'anurag3301/nvim-platformio.lua',
  rocks = {'luasec'},
  dependencies = {
    {'akinsho/nvim-toggleterm.lua'},
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/plenary.nvim'},
  },
  cond = check_platformio()
}

-- ~/.config/nvim/lua/plugins/snacks.lua

  local function dash_key(icon, desc, key)
    return {
    { icon .. "  ", "SnacksDashboardIcon" },
    { desc, "SnacksDashboardDesc" },
    { string.rep(" ", 40 - #desc) .. key .. "\n\n", "SnacksDashboardKey" },    }
  end
  
  local keys = {}
  
  for _, item in ipairs({
    { "", "Find File", "ff" },
    { "", "Recent Files", "fr" },
    { "", "Find Text", "fg" },
    { "", "Org dir", "od" },
    { "", "Config", "fc" },
    { "󰘦", "Stow", "fC" },
    { "󱄅", "Nix", "fN" },
    { "󰩈", "Exit", "qq" },
  }) do
    vim.list_extend(keys, dash_key(item[1],   item[2],   item[3]))
  end
  
  return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          {
            section = "terminal",
            cmd = "chafa ~/Assets/Decor/Banner/current.png --format symbols --symbols vhalf --size 55x15 --stretch; sleep .1",
            height = 15,
            padding = 1,
          },
  
          {
            pane = 2,
            text = keys,
            align = "center",
            width = 50,
          },
        },
      },
  
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },
      image = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
    },
  }

-- ~/.config/nvim/lua/plugins/org.lua

return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/Org/**/*',
      org_default_notes_file = '~/Org/Templates/refile.org',
    })
    -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}
    

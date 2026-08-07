-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    opts = {
        ensure_installed = {

        -- languages
        "c", 
        "rust", 
        "python",
        "html", 
        "css", 
        "json", 
        "bash",
        "http", 
        "nix", 
        "latex", 
        "markdown",
        "org",
        
        -- extras
        
        "javascript", 
        "typescript",
        "dockerfile",
    
      },
    },

    config = function(_, opts)
        local ts = require("nvim-treesitter")
        ts.setup()

        local patterns = {}

        for _, parser in ipairs(opts.ensure_installed) do
          local ok, filetypes = pcall(vim.treesitter.language.get_filetypes, parser)

          if ok then
            vim.list_extend(patterns, filetypes)
          else
            vim.schedule(function()
                ts.install(parser)
            end)

          end

          patterns = vim.list.unique(patterns)        

        end

        local group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = patterns,
            callback = function(ev)
                local ok, lang = pcall(
                    vim.treesitter.language.get_lang,
                    vim.bo[ev.buf].filetype
                )
                
                if not ok then
                    return
                end
                
                pcall(vim.treesitter.language.add, lang)
                
                local started = pcall(vim.treesitter.start, ev.buf, lang)
                if started then
                    vim.bo[ev.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end
         })
    end,
 }

--- @type table<string, any>
local M = {}

--- @param opts? {}
function M.setup(opts)
  vim.filetype.add({
    extension = { tpp = "tpp" },
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
      require("nvim-treesitter.parsers").tpp = {
        install_info = {
          url = "https://github.com/Itiro-P/tree-sitter-tpp",
          revision = "0.1.5",
          queries = "queries",
          locals = "locals",
          folds = "folds"
        },
      }
    end,
  })

  require("nvim-treesitter").install({ "tpp" })
end

return M

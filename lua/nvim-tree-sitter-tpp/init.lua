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
          revision = "0.1.9",
          queries = "queries",
        },
      }
    end,
  })
end

return M

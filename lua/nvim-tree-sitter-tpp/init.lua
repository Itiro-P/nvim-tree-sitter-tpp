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
          revision = "0.1.1",
          queries = "queries",
          locals = "locals",
        },
      }
    end,
  })

  require("nvim-treesitter").install({ "tpp" })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "tpp",
    callback = function()
      vim.treesitter.start()
      vim.wo[0][0].folderxp = "v:lua.vim.treesitter.folderxpr()"
      vim.wo[0][0].foldmethod = "expr"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  })
end

return M

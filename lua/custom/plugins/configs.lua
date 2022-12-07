local M = {}

M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    side = "right",
    width = 20,
  },
}

M.nvterm = {
  type_opts = {
    float = {
      width = 1.0,
      height = 0.6,
    }
  }
}

M.treesitter = function()
  return {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    }
  }
end

return M

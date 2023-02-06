-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "chadracula",
}

local pluginConfs = require "custom.plugins.configs"

M.plugins = {
  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["NvChad/nvterm"] = pluginConfs.nvterm,
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
    ["tzachar/cmp-tabnine"] = pluginConfs.tabnine,
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
  },
  user = require "custom.plugins",
}

return M

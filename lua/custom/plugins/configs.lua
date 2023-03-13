local M = {}

M.nvimtree = {
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  view = {
    side = "left",
    width = 20,
  },
  renderer = {
    highlight_git = true,
    icons = {
      git_placement = "before",
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
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

M.cmp = function()
  return {
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == 'cmp_tabnine' and entry.completion_item.data ~= nil then
          vim_item.kind = string.format("%s %s", '', ' TabNine')
        else
          local icons = require("nvchad_ui.icons").lspkind
          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        end

        return vim_item
      end,
    },
    sources = {
      { name = "cmp_tabnine" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
end

M.tabnine = function()
  return {
    max_lines = 1000,
    max_num_results = 5,
    sort = true,
    run_on_every_keystroke = true,
    show_prediction_strength = false
  }
end

M.treesitter = function()
  return {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    autotag = {
      enable = true
    },
    -- TODO(Vi) For some reason, not installing automatically
    ensure_installed = {
      "html",
      "jsx",
      "tsx",
      "css"
    },
    auto_install = true,
  }
end

M.mason = {
  ["williamboman/mason.nvim"] = {
    ensure_installed = { "lua-language-server", "cpp", "bash-language-server", "deno", "emmet-ls" },
  }
}

return M

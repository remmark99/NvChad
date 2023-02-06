local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  b.diagnostics.cppcheck.with { args = { "--enable=warning,style,performance,portability", "--template=gcc", "--std=c11", "$FILENAME" }},
  b.diagnostics.cpplint,

  -- asm
  b.formatting.asmfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

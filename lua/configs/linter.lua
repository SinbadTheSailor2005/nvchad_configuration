local lint = require "lint"

lint.linters_by_ft = {
  cpp = { "cpplint" },
  python = { "pylint", "ruff" },
  java = { "checkstyle" },
}

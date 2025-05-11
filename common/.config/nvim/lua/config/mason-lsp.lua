function Configure()
    require("mason").setup()
    -- require("mason-lspconfig").setup {
    --     ensure_installed = {
    --         --        "autopep8",
    --         --        "awk",
    --         "clangd",
    --         -- "clang-format",
    --         -- "codelldb",
    --         "cmake",
    --         --      "debugpy",
    --         "dockerls",
    --         "docker_compose_language_service",
    --         --        "golangci-lint",
    --         "gopls",
    --         "lua_ls",
    --         --       "pylint",
    --         "mypy",
    --         "ruff",
    --         "pylsp",
    --         "pyright",
    --         --       "rust-analyzer",
    --         --       "selene",
    --         "sqls",
    --         "tsserver"
    --     },
    -- }
end
return { Configure=Configure}

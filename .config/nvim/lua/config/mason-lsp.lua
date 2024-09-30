function Configure()
    require("mason-lspconfig").setup {
        ensure_installed = {
            --        "autopep8",
            --        "awk",
            "clangd",
            "cmake",
            --      "debugpy",
            "dockerls",
            "docker_compose_language_service",
            --        "golangci-lint",
            "gopls",
            "lua_ls",
            --       "pylint",
            "pylsp",
            --       "rust-analyzer",
            --       "selene",
            "sqls",
            "tsserver"
        },
    }
end
return { Configure=Configure}

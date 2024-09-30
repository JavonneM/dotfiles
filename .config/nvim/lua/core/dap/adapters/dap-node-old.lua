require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            name = "Launch via NPM",
            type = "node-terminal",
            request = "launch",
            cwd = "${workspaceRoot}",
            runtimeExecutable = "npm",
            runtimeArgs = {
                "run-script", "debug"
            },
            port = 9229
        },
        {
            name = "Launch via cat",
            type = "pwa-node",
            request = "launch",
            cwd = "${workspaceRoot}",
            runtimeExecutable = "node",
            runtimeArgs = {
                "${file}"
            },
            port = 9229
        },

        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch Program",
            skipFiles = {
                "<node_internals>/**"
            },
            console = "integratedTerminal",
            program = "${workspaceFolder}/src/app.ts",
            preLaunchTask = "tsc: build - tsconfig.json",
            outFiles = {
                "${workspaceFolder}/dist/**/*.js"
            }
        },
        {
            name = "Docker Node.js Launch",
            type = "docker",
            request = "launch",
            preLaunchTask = "docker-run: debug",
            platform = "node"
        },
        {
            name = "Docker: Attach to Node",
            type = "pwa-node",
            request = "attach",
            port = 9229, -- Optional; otherwise inferred from the docker-compose.debug.yml.
            localRoot = "${workspaceFolder}",
            remoteRoot = "/app",
            sourceMaps = true,
            smartStep = true
        },
    }
end

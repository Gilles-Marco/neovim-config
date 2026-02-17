return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')
        dap.adapters.python = function(cb, config)
            if config.request == "attach" then
                local port = (config.connect or config).port
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = "python",
                    },
                })
            else
                cb({
                    type = 'executable',
                    command = 'python',
                    args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = "python",
                    },
                })
            end
            dap.configurations.python = {
                {
                    type = 'python',
                    request = "launch",
                    name = "Launch file",

                    program = "${file}",
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                            return cwd .. '/venv/bin/python'
                        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                            return cwd .. '/.venv/bin/python'
                        else
                            return '/usr/bin/python'
                        end
                    end
                }
            }
        end
    end,
    keys = {
        { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Debug Toggle breakpoint" },
        { "<leader>dc", function() require('dap').continue() end,          desc = "Debug continue" },
        { "<leader>dC", function() require('dap').run_to_cursor() end,     desc = "Debug run to cursor" },
        { "<leader>dT", function() require('dap').terminate() end,         desc = "Debug terminal" }
    }
}

return {
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = "VeryLazy",
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap'
        },
        opts = {
            configurations = {
                codelldb = {
                    {
                        name = 'LLDB: Launch',
                        type = 'codelldb',
                        request = 'launch',
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = '${workspaceFolder}',
                        stopOnEntry = false,
                        args = function()
                            return vim.fn.input('Arguments: ', '', 'file')
                        end,
                        console = 'integratedTerminal',
                    },
                }
            },
            handlers = {}
        }
    },
    {
        'mfussenegger/nvim-dap',
        keys = {
            { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
            { "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>",         desc = "Open REPL" },
            { "<leader>dl", "<cmd>lua require('dap').run_last()<CR>",          desc = "Run Last" },
            { "<F5>",       "<cmd>lua require('dap').continue()<CR>",          desc = "Continue" },
            { "<F6>",       "<cmd>lua require('dap').step_over()<CR>",         desc = "Step Over" },
            { "<F7>",       "<cmd>lua require('dap').step_into()<CR>",         desc = "Step Into" },
            { "<F8>",       "<cmd>lua require('dap').step_out()<CR>",          desc = "Step Out" },
        },
        config = function()
            local dap_breakpoint = {
                breakpoint = {
                    text = "",
                    texthl = "LspDiagnosticsSignError",
                    linehl = "",
                    numhl = "",
                },
                rejected = {
                    text = "x",
                    texthl = "LspDiagnosticsSignHint",
                    linehl = "",
                    numhl = "",
                },
                stopped = {
                    text = "",
                    texthl = "LspDiagnosticsSignInformation",
                    linehl = "DiagnosticUnderlineInfo",
                    numhl = "LspDiagnosticsSignInformation",
                },
            }

            vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
            vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
            vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keys = {
            { "K",     "<cmd>lua require('dapui').eval()<CR>",   desc = "Evaluate" },
            { "<F10>", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            dap.defaults.fallback.terminal_win_cmd = "30vsplit new"
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        opts = {
            virt_text_pos = 'eol',
            all_frames = true
        }
    }
}

local lsp        = require "nvim_lsp"
local configs    = require "nvim_lsp/configs"
local util       = require "nvim_lsp/util"
local completion = require "completion"

local sync_timeout = 150

function document_format_sync()
    vim.lsp.buf.formatting_sync(ni, sync_timeout)
end

function document_format_and_organise_sync()
    document_format_sync()
end
-- -- typescript -- --
configs.custom_typescript = {
    default_config = {
        cmd = {"typescript-language-server", "--stdio"},
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx"
        },
        root_dir = util.root_pattern("package.json", "tsconfig.jon", ".git")
    }
}

-- -- vue -- --
configs.custom_vue = {
    default_config = {
        cmd = {"vls"},
        filetypes = {"vue"},
        root_dir = util.root_pattern("package.json", ".git"),
        init_options = {
            config = {
                vetur = {
                    validation = {
                        templateProps = true,
                    },
                    completion = {
                        tagCasing = "initial",
                        autoImport = false,
                        useScaffoldSnippets = false,
                    },
                    format = {
                        defaultFormatter = {
                            html = "prettier",
                            pug = "prettier",
                            css = "none",
                            postcss = "prettier",
                            scss = "prettier",
                            less = "prettier",
                            stylus = "stylus-supremacy",
                            js = "prettier",
                            ts = "prettier",
                            sass = "sass-formatter"
                        }
                    },
                    experimental = {
                        templateInterpolationService = true,
                    }
                }
            }
        }
    }
}



local configs = {
    lsp.custom_typescript,
    lsp.custom_vue,
}

for i, config in pairs(configs) do
    config.setup({
        on_attach = function(client, buffer)
            completion.on_attach(client, buffer)
        end
    })
end

return {
    'stevearc/conform.nvim',
    opts = {
        formatter_by_ft = {
            lua = { "stylelua" },
            python = { "black", "isort" },
            rust = { "rustfmt", lsp_format = "fallback" },
            terraform = { "terraform_fmt" },
            ["terraform-vars"] = { "terraform_fmt" },
            tf = { "terraform_fmt" },
            hcl = { "packer_fmt" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            zsh = { "shfmt" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            java = { "google-java-format" },
            xml = { "xmlformatter" },
            ["*"] = { "codespell" },
            ["_"] = { "trim_whitespace" },
        },
        format = {
            timeout_ms = 500
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}

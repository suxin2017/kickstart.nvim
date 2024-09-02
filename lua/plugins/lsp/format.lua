return { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = { 'n', 'v' },
            desc = 'Code format',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true, rust = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'prettierd' },
            typescript = { 'prettierd' },
            javascriptreact = { 'prettierd' },
            typescriptreact = { 'prettierd' },
            svelte = { 'prettierd' },
            css = { 'prettierd' },
            html = { 'prettierd' },
            json = { 'prettierd' },
            yaml = { 'prettierd' },
            markdown = { 'prettierd' },
            graphql = { 'prettierd' },
        },
    },
}

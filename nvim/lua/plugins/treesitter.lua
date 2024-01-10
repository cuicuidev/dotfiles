return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
              ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "heex",
                    "javascript",
                    "html",
                    "typescript",
                    "css",
                    "python",
                    "rust",
                    "bash",
                    "toml",
                    "yaml",
                    "json",
                    "dockerfile",
                    "dart",
                    "sql",
                    "markdown",
                    "markdown_inline",
                    "kotlin",
                },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
    end
}

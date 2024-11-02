return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
              ensure_installed = {
                    "query",
                    "python",
                    "zig",
                    "lua",
                    "c",
                    "vim",
                    "vimdoc",
                    "bash",
                    "toml",
                    "yaml",
                    "json",
                    "dockerfile",
                    "sql",
                    "markdown",
                    "markdown_inline",
                },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },
            })
    end
}

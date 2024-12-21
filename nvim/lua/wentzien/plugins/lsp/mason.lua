return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clangd", -- c, cpp
				-- "java_language_server", -- java
				"pyright", -- python
				-- "rust_analyzer", -- rust
				"verible", --systemverilog
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "black", -- python formatter
				-- "clang_format",
				--"clang_tidy",
				-- "clippy",
				"isort", -- python formatter
				--"luacheck",
				"markdownlint",
				"mypy",
				"prettier", -- prettier formatter
				-- "rustfmt",
				"stylua",
				"verible",
			},
		})
	end,
}

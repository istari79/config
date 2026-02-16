return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- c = { "clang-format" },
				-- cpp = { "clang-format" },
				-- lua = { "stylua" },
				markdown = { "prettier" },
				ocaml = { "ocamlformat" },
				-- python = { "isort", "black" },
				-- rust = { "rustfmt" },
				systemverilog = { "verible" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		conform.formatters.prettier = {
			prepend_args = { "--prose-wrap=always" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

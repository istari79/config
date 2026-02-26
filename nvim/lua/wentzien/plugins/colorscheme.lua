return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local theme_file = vim.fn.expand("~/.config/.theme_mode")
			local theme = vim.fn.readfile(theme_file)[1]
			assert(theme == "light" or theme == "dark", "Invalid theme in .theme_mode: " .. theme)

			local flavour_map = {
				dark = "mocha",
				light = "latte",
			}

			require("catppuccin").setup({
				flavour = flavour_map[theme],
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

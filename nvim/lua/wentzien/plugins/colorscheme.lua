return {
	{
		"catppuccin/nvim",
		priority = 1000, -- Ensure it loads first
		-- config = function()
		-- Load Catppuccin as your colorscheme
		-- vim.cmd("colorscheme catppuccin-latte")
		-- end,
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },

	--neovim and iterm sync function
	{
		-- "catppuccin/nvim",
		"folke/tokyonight.nvim",
		priority = 999,
		config = function()
			local function get_iterm_profile()
				local profile = vim.fn.system("echo $ITERM_PROFILE")
				return profile
			end

			local function set_theme()
				local profile = get_iterm_profile()

				-- if profile:match("mocha_mode") then
				vim.cmd("colorscheme tokyonight-moon")
				vim.o.background = "dark"
				-- else
				-- 	vim.cmd("colorscheme catppuccin-latte")
				-- 	vim.o.background = "light"
				-- end
				-- print("the profile is " .. profile)
			end

			set_theme()
		end,
	},
}

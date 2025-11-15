return  {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
        ensure_installed = {
          "cpp", -- C++
          "cmake", -- CMake
          "python", -- Python
          "xml", -- XML
          "lua", -- For your nvim config
        },
			auto_install =true,
			highlight = {enable = true},
			indent = {enable = true},
			})
		end
	},

}

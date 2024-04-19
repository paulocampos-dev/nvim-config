local map = vim.keymap.set

return {
	{
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			--- @diagnostic disable: unused-local
			require("ufo").setup({
				provider_selector = function(_bufnr, _filetype, _buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
		keys = {
			map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open All Folds" }),
			map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close Folds" }),
		},
	},
}

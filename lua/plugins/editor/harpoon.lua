local map = vim.keymap.set

return {
	{
		"ThePrimeagen/harpoon",
		lazy = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		keys = {
			map("n", "<leader>ho", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon Quick Menu" }),
			map("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Add File to Harpoon" }),
			map("n", "<leader>hc", function() require("harpoon.mark").clear_all() end, { desc = "Clear All Harpoon Files" }),
			map("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon to first file" }),
			map("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon to second file" }),
			map("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon to third file" }),
			map("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon to fourth file" }),
			map("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end, { desc = "Harpoon to fifth file" }),
		},
	}
}

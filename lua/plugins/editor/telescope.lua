local map = vim.keymap.set

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	opts = {
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = false,
					["<C-h>"] = "which_key",
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
		},
		extensions = {
			-- Your extension configuration goes here:
		},
	},

	config = function()
		pcall(require("telescope").load_extension, "fzf")

		-- Telescope live_grep in git root
		-- Function to find the git root directory based on the current buffer's path
		local function find_git_root()
			-- Use the current buffer's path as the starting point for the git search
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()
			-- If the buffer is not associated with a file, return nil
			if current_file == "" then
				current_dir = cwd
			else
				-- Extract the directory from the current file's path
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			-- Find the Git root directory from the current file's path
			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		-- Custom live_grep function to search in git root
		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end

		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
	end,

	keys = {
		map("n", "<leader><space>", ":Telescope find_files<CR>", { desc = "Fuzzy Finder" }),
		map("n", "<leader>sg", ":Telescope live_grep<CR>", { desc = "[S]earch [G]rep" }),
		map("n", "<leader>B", ":Telescope buffers<CR>", { desc = "[B]uffer [S]earch" }),
		map("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "[S]earch [H]elp" }),
		map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Search Keymaps" }),
		map("n", "<leader>fa", ":Telescope <CR>", { desc = "Telescope All" }),
		map("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" }),
		map("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" }),
		map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]ind [D]iagnostics" }),
		map("n", "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" }),
	},
}

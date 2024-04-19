require("core.globals")
require("core.options")
require("core.autocomands")
require("core.keymaps")

-- lazy can manage itself
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {

	install = {
		colorscheme = { "catppuccin" },
	},
})

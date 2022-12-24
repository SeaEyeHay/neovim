
--[[----------------------------------------------------------

                              __     __  ______  __       __ 
                             |  \   |  \|      \|  \     /  \
 _______    ______    ______ | $$   | $$ \$$$$$$| $$\   /  $$
|       \  /      \  /      \| $$   | $$  | $$  | $$$\ /  $$$
| $$$$$$$\|  $$$$$$\|  $$$$$$\\$$\ /  $$  | $$  | $$$$\  $$$$
| $$  | $$| $$    $$| $$  | $$ \$$\  $$   | $$  | $$\$$ $$ $$
| $$  | $$| $$$$$$$$| $$__/ $$  \$$ $$   _| $$_ | $$ \$$$| $$
| $$  | $$ \$$     \ \$$    $$   \$$$   |   $$ \| $$  \$ | $$
 \$$   \$$  \$$$$$$$  \$$$$$$     \$     \$$$$$$ \$$      \$$
                                                             
                                                             
                                                             
--]]---------------------------------------------------------


-- Install plugins using Packer
require "plugins"

-- Custom keybindings
require "bindings"


--[[----------------------------------------------------------
																								Defaults Settings
--]]----------------------------------------------------------

vim.opt.termguicolors = true								-- Enable TrueColors 
vim.opt.cursorline = true											-- Highlight the current line
vim.opt.hlsearch = true													-- Set highlight on search
vim.opt.number = true															-- Make line numbers default
vim.opt.mouse = "a"																	-- Enable mouse mode
vim.opt.breakindent = true										-- Enable break indent
vim.opt.undofile = true													-- Save undo history
vim.opt.smartcase = true												-- Smart case
vim.opt.updatetime = 250												-- Decrease update time
vim.opt.signcolumn = "yes"										-- Always show sign column
vim.opt.clipboard = "unnamedplus"			-- Access system clipboard

-- Highlight on yank
vim.cmd [[
				augroup YankHighlight
								autocmd!
								autocmd TextYankPost * silent! lua vim.highlight.on_yank()
				augroup end
]]


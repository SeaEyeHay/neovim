local map = vim.keymap.set


--[[-----------------------------------
												Switching buffers
--]]-----------------------------------
map('n', ',', ":bprevious<CR>", {silent = true})
map('n', '.', ":bnext<CR>", {silent = true})



-- Indicate first time installation
local packer_bootstrap = false


--[[------------------------------------------------------------------
																												START PLUGINS
--]]------------------------------------------------------------------
local function plugins(use)
				use { "wbthomason/packer.nvim" }


				--[[-------------------------------------------
																Linting and Completions
				--]]-------------------------------------------
				-- Completion Engine
				use 'hrsh7th/cmp-nvim-lsp'
				use 'hrsh7th/cmp-buffer'
				use 'hrsh7th/cmp-path'
				use 'hrsh7th/cmp-cmdline'

				-- Snippet engine
				use 'hrsh7th/cmp-vsnip'
				use 'hrsh7th/vim-vsnip'

				use {
								'neovim/nvim-lspconfig',
								requires = 'hrsh7th/nvim-cmp',

								config = function()
												local configs = require 'config.lang'

												-- Configuration for each languages
												configs.lua()
												configs.c()
								end
				}

				use {
								'hrsh7th/nvim-cmp',
								requires = {
												'hrsh7th/cmp-nvim-lsp',					'hrsh7th/cmp-buffer',			'hrsh7th/cmp-path',
												'hrsh7th/cmp-cmdline',						'hrsh7th/cmp-vsnip',				'hrsh7th/vim-vsnip'
								},

								config = function() require("config.lang").cmp() end
				}


				--[[-------------------------------------------
																							Colorscheme
				--]]-------------------------------------------
				use {
								'lukas-reineke/indent-blankline.nvim',
								cond = function () return false end,
								config = function ()
												vim.opt.list = true
												vim.opt.listchars:append "eol:↴"
												require("indent_blankline").setup {show_end_of_line = false}
								end
				}

				use {
								'morhetz/gruvbox',
								config = function() vim.cmd [[colorscheme gruvbox]] end,
				}

				use {
								'nvim-tree/nvim-web-devicons',
								config = function() require('nvim-web-devicons').setup {} end
				}


				--[[------------------------------------------
																User Interfaces Plugins
				--]]------------------------------------------
				use {
								'nvim-lualine/lualine.nvim',
								config = function() require('lualine').setup {} end,

								requires = { 'kyazdani42/nvim-web-devicons', opt = true },
				}

				use {
								'romgrk/barbar.nvim',
								requires = 'nvim-web-devicons'
				}

				use {
								'ctrlpvim/ctrlp.vim',
								config = function() vim.g.ctrlp_tabpage_position = 'ac' end
				}

				use {
								'wfxr/minimap.vim',
								cond = function () return false end,
								config = function ()
												vim.g.minimap_width = 12
												vim.g.minimap_auto_start = 1
								end
				}


				--[[------------------------------------------
																		SYNTAX HIGHLIGHTING
				--]]------------------------------------------
				use {
								'nvim-treesitter/nvim-treesitter',
								run = ':TSUpdate',
								config = function () require('config.lang').highlight() end
				}


				--[[------------------------------------------
																Quality of life stuff
				--]]------------------------------------------
				use 'vim-scripts/delimitMate.vim'
				use 'tpope/vim-eunuch'

				-- Startup screen
				use {
								"goolord/alpha-nvim",
								cond = function() return false end,
								config = function() require("config.alpha").setup() end,
				}

				-- Git
				use {
								"TimUntersberger/neogit",
								config = function() require("config.neogit").setup() end,

								requires = "nvim-lua/plenary.nvim",
				}

				use {
								'easymotion/vim-easymotion',
								config = function() vim.cmd [[map <Leader> <Plug>(easymotion-prefix)]] end
				}

				if packer_bootstrap then
								print "Restart Neovim required after installation!"
								require("packer").sync()
				end
end
--[[------------------------------------------------------------------
																												   END PLUGINS
--]]------------------------------------------------------------------


-- packer.nvim configuration
local conf = {
				display = {
								open_fn = function()
												return require("packer.util").float { border = "rounded" }
								end,
				},
}

-- Check if packer.nvim is installed
-- Run PackerCompile if there are changes in this file
local function packer_init()
				local fn = vim.fn
				local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
				if fn.empty(fn.glob(install_path)) > 0 then
								packer_bootstrap = fn.system {
												"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
												install_path,
								}
								vim.cmd [[packadd packer.nvim]]
				end
				vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]
end


packer_init()

local packer = require "packer"
packer.init(conf)
packer.startup(plugins)


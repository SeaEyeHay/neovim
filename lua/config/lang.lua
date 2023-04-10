--[[-------------------------------------------------------------
				
--]]-------------------------------------------------------------
--
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require 'lspconfig'
local cmp = require 'cmp'


local configs = {}

function configs.lua()
			 lsp.lua_ls.setup {
								capabilities = capabilities,
								root_dir = lsp.util.root_pattern('.luarc.json', 'init.lua', '.git'),
								settings = {
												Lua = {
																runtime = {
																				version = 'Lua 5.3',
																				path = {
																								'?.lua',
        																'?/init.lua',
        																vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
        																vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
        																'/usr/share/5.3/?.lua',
        																'/usr/share/lua/5.3/?/init.lua',
																				}
																},

																diagnostics = {
																				-- Get the language server to recognize the `vim` global
																				globals = { 'vim', 'awesome' },
																},

																workspace = {
																				library = vim.api.nvim_get_runtime_file("", true),
																},

																-- Do not send telemetry data containing a randomized but unique identifier
																telemetry = { enable = false },
												},
								}
				}
end

function configs.c()
				lsp.clangd.setup {
								capabilities = capabilities,
								root_dir = lsp.util.root_pattern('CMakeLists.txt', 'compile_commands.json')
				}
end

function configs.rust()
				local nvim_lsp = require'lspconfig'

				local on_attach = function(client)
				    require'completion'.on_attach(client)
				end

				nvim_lsp.rust_analyzer.setup({
				    on_attach=on_attach,
				    settings = {
				        ["rust-analyzer"] = {
				            imports = {
				                granularity = {
				                    group = "module",
				                },
				                prefix = "self",
				            },
				            cargo = {
				                buildScripts = {
				                    enable = true,
				                },
				            },
				            procMacro = {
				                enable = true
				            },
				        }
				    }
				})
end


function configs.cmp()
				cmp.setup {
								snippet = {
												expand = function(args) vim.fn['vsnip#anonymous'](args.body) end
								},
								mapping = cmp.mapping.preset.insert {
												['<C-b>'] = cmp.mapping.scroll_docs(-4),
      						['<C-f>'] = cmp.mapping.scroll_docs(4),
      						['<C-Space>'] = cmp.mapping.complete(),
      						['<C-e>'] = cmp.mapping.abort(),
      						['<CR>'] = cmp.mapping.confirm({ select = true }),
								},

								sources = cmp.config.sources({
												{ name = 'nvim_lsp' }
								}, {
												{ name = 'buffer' }
								})

				}
end

function configs.highlight()
				require('nvim-treesitter.configs').setup {
								-- A list of parser names, or "all"
								ensure_installed = { "c", "lua", "rust", "cmake" },

								-- Install parsers synchronously (only applied to `ensure_installed`)
								sync_install = false,

								-- Automatically install missing parsers when entering buffer
								-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
								auto_install = true,


								highlight = {
												-- `false` will disable the whole extension
												enable = true,

												-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
												-- Instead of true it can also be a list of languages
												additional_vim_regex_highlighting = false,
								},
				}
end


return configs


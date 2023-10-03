return {
	'VonHeikemen/lsp-zero.nvim', 
	branch = 'v3.x',
	dependencies = {
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	config = function()
		local lsp_zero = require 'lsp-zero'

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason').setup()

		require('mason-lspconfig').setup({
			ensure_installed = {
				'lua_ls',
			},
			handlers = {
				lsp_zero.default_setup,
			},
		})

		local lspconfig = require 'lspconfig'

		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					runtime = { version = 'LuaJIT' },
					diagnostics = {
						globals = {
							'vim',
						},
					},
				},
			},
		}
	end,
}

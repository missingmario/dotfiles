-- Setup 

local tree = require 'nvim-tree'

tree.setup({
	filters = {
		dotfiles = false,
	},
})

-- Keymaps

local api = require 'nvim-tree.api'

vim.keymap.set('n', '<leader>tt', function() api.tree.toggle() end)

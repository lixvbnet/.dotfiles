local M = {}

-- disable default mappings
M.disabled = {
	i = {
		["jk"] = "",
		["<C-b>"] = "",
	},
    n = {
        ["<leader>uu"] = "",
        ["<C-c>"] = "",
        ["<C-h>"] = "",
        ["<C-l>"] = "",
        ["<C-j>"] = "",
        ["<C-k>"] = "",
        ["<S-b>"] = "",
    },
	t = {
		["jk"] = "",
	},
}

-- define new or override defaut mappings
M.general = {
	i = {
		["<C-a>"] = { "<ESC>^i", "論 beginning of line" },
		["<C-e>"] = { "<End>", "壟 end of line" },
	},
	n = {
		["<leader>q"] = { "<cmd> :q <CR>" },
	},
}

return M

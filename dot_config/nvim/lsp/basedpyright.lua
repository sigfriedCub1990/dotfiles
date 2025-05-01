return {
	cmd = { "basedpyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "manage.py" },
	filetypes = { "python" },
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}

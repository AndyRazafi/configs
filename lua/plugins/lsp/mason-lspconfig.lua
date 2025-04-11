return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = { "mason.nvim", { "antosha417/nvim-lsp-file-operations", config = true } },
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = { "lua_ls", "vtsls" },
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts) -- show defition, references

			opts.desc = "Go to defition"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP defitions"
			keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp defitions

			opts.desc = "Show LSP type defitions"
			keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type defitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts) -- show lsp defitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", ":Telescope diagnostics bufrn=0<CR>", opts) -- show diagnostics for file

			-- opts.desc = "Show line diagnostics"
			-- keymap.set("n", "<leader>d", vim.diagnostics.open_float, opts) -- show diagnostics for line

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- restart lsp
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
					},
				},
			},
		})

		lspconfig.vtsls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			vtsls = {
				enableMoveToFileCodeAction = true,
				autoUseWorkspaceTsdk = true,
				experimental = {
					maxInlayHintLength = 30,
					completion = {
						enableServerSideFuzzyMatch = true,
					},
				},
			},
			settings = {
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
				},
			},
			typescript = {
				format = {
					semicolons = "insert",
				},
				updateImportsOnFileMove = {
					enabled = "always",
				},
				suggest = {
					autoImports = true,
					includeCompletionsForImportStatements = true,
				},
			},
			javascript = {
				format = {
					semicolons = "insert",
				},
				updateImportsOnFileMove = {
					enabled = "always",
				},
				suggest = {
					autoImports = true,
					includeCompletionsForImportStatements = true,
				},
			},
			commands = {
				OrganizeImports = {
					function()
						local params = {
							command = "typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(0) },
							title = "",
						}
						vim.lsp.buf.execute_command(params)
					end,
					description = "Organize Imports",
				},
			},
		})

		lspconfig.emmet_language_server.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"less",
				"sass",
				"scss",
				"pug",
			},
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP reference" })
			keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
			keymap.set({ "n", "v" }, "<leader>fa", vim.lsp.buf.code_action, { desc = "See available code actions" })
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show line diagnostics" })
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
			keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Jump to previous diagnostics in buffer" })
			keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Jump to next diagnostics in buffer" })
			keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentations for what is under cursor" })
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the diagnostics symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "✱ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticsSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hi, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescript", "javascript", "css", "sass", "scss", "less" },
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize vim global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

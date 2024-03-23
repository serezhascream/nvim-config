vim.g.mapleader = " "

local keymap = vim.keymap

-- Define a Lua function to switch to the previous buffer and then delete the current buffer
function SwitchAndDeleteBuffer()
	-- Check if the current buffer is nvim-tree
	local buf_is_nvim_tree = vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree"
	if buf_is_nvim_tree then
		vim.cmd("NvimTreeToggle") -- Toggle nvim-tree
	else
		vim.cmd("bp|bd #") -- Switch to previous buffer and delete current buffer
	end
end

-- Override the default bd command with the new functionality
vim.cmd("command! -nargs=0 Bd lua SwitchAndDeleteBuffer()")

-- clear search highlighter
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- incrementing/decrementing
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- split and navigation within splits
keymap.set("n", "<leader>sv", "<C-W>v") -- split window vertically
keymap.set("n", "<leader>sb", "<C-W>s") -- split window horizontally
keymap.set("n", "<leader>sh", "<C-W><C-H>") -- move cursor to right split
keymap.set("n", "<leader>sl", "<C-W><C-L>") -- move cursor to left split
keymap.set("n", "<leader>st", "<C-W><C-W>") -- toggle window
keymap.set("n", "<leader>sc", ":close<CR>") -- close active split window
-- buffers and tabs
keymap.set("n", "<leader>bd", ":Bd<CR>") -- switch to previous buffer and close (allows to prevent closing split window)
keymap.set("n", "<leader>bn", ":bn<CR>") -- go to next buffer
keymap.set("n", "<leader>bp", ":bp<CR>") -- go to previous buffer
keymap.set("n", "<leader>bf", ":bf<CR>") -- go to first buffer
keymap.set("n", "<leader>bl", ":bl<CR>") -- go to last buffer
keymap.set("n", "<leader>tn", ":tabNext<CR>") -- switch to next tab

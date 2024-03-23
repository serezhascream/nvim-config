vim.g.mapleader = " "
local keymap = vim.keymap

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
-- buffers
keymap.set("n", "<leader>bd", ":bd<CR>") -- close buffer
keymap.set("n", "<leader>bn", ":bn<CR>") -- go to next buffer
keymap.set("n", "<leader>bp", ":bp<CR>") -- go to previous buffer

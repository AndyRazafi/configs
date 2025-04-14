vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Disable shift up and down behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<S-up>", "<Nop>")
keymap.set({ "n", "v" }, "<S-down>", "<Nop>")

-- Disable s key behavior
keymap.set("n", "s", "<Nop>")

-- Command mode by hitting ";"
keymap.set({ "n", "v" }, ";", ":", { nowait = true })

-- Window management
keymap.set("n", "<leader>ww", "<C-w><C-w>", { desc = "Move to next window" })
keymap.set("n", "<leader>wW", "<C-w>W", { desc = "Move to previous window" })
keymap.set("n", "<S-right>", "<C-w><C-w>", { desc = "Move to next window" })
keymap.set("n", "<S-left>", "<C-w>W", { desc = "Move to previous window" })
keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Close window" })
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window verticaly" })
keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wo", ":only<CR>", { desc = "Close other windows" })
keymap.set("n", "<leader>wm", "<C-w>|<CR>", { desc = "Max out window" })
keymap.set("n", "<leader>w=", "<C-w>=<CR>", { desc = "Equally windows width and height" })

-- Buffers
keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

-- Clear highlights
keymap.set("n", "<Esc>", ":noh<CR>")

-- Move text up and down
keymap.set("n", "<M-up>", ":m-2<CR>")
keymap.set("n", "<M-down>", ":m+1<CR>")

-- Find and center
keymap.set("n", "n", "nzzzv", { desc = "Next and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous and center" })

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP')

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Quit Neovim
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit Nvim" })

-- Terminal
keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- movement
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<", function()
	vim.cmd("normal! <")
	vim.cmd("normal! gv")
end)

vim.keymap.set("v", ">", function()
	vim.cmd("normal! >")
	vim.cmd("normal! gv")
end)

-- save/quit
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")

-- center screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "%", "%zz")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
	vim.api.nvim_feedkeys("zz", "n", false)
end)

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
	vim.api.nvim_feedkeys("zz", "n", false)
end)

vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- blackhole paste/delete
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- system clipboard yank
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- other
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- something to do with the quickfix list?
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find/replace word under cursor
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- exe permisions to current buffer
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

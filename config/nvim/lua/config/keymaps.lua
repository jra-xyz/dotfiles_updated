-- Unmaps to avoid conflicts
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")

--------- Buffer/Window Manipulation ----------
-- Bind Alt + H to move to the left window
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move to the left window" })

-- Bind Alt + L to move to the right window
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move to the right window" })

-- Bind Alt + J to move to the window below
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move to the window below" })

-- Bind Alt + K to move to the window above
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move to the window above" })

-- Bind Tab to go to the next buffer, Shift+Tab goes to previous buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })

vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })

-- Bind Alt + Q to close the current buffer, keeps window
vim.keymap.set("n", "<A-q>", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- Bind Alt + Left to close a vertical split
vim.keymap.set("n", "<A-Left>", ":close<CR>", { noremap = true, silent = true, desc = "Close vertical split" })

-- Bind Alt + Right to create a vertical split
vim.keymap.set("n", "<A-Right>", ":vsplit<CR>", { noremap = true, silent = true, desc = "Create vertical split" })

-- Bind Alt + Up to close a horizontal split
vim.keymap.set("n", "<A-Up>", ":close<CR>", { noremap = true, silent = true, desc = "Close horizontal split" })

-- Bind Alt + Down to create a horizontal split below
vim.keymap.set("n", "<A-Down>", ":split<CR>", { noremap = true, silent = true, desc = "Create horizontal split below" })

----------------- Movement -----------------------

-- Bind Control + H to jump to the beginning of the previous word
vim.keymap.set(
  "n",
  "<C-h>",
  "b",
  { noremap = true, silent = true, desc = "Jump to the beginning of the previous word" }
)

-- Bind Control + L to jump to the end of the current/next word
vim.keymap.set("n", "<C-l>", "e", { noremap = true, silent = true, desc = "Jump to the end of the current/next word" })

-- Bind Alt + Left Arrow to go to the previous buffer
vim.keymap.set("n", "<A-Left>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Go to previous buffer" })

-- Bind Control + J to jump down by paragraph
vim.keymap.set("n", "<C-j>", "}", { noremap = true, silent = true, desc = "Jump down by paragraph" })

-- Bind Control + K to jump up by paragraph
vim.keymap.set("n", "<C-k>", "{", { noremap = true, silent = true, desc = "Jump up by paragraph" })

-- Bind W to jump to the top of the file
vim.keymap.set("n", "W", "gg", { noremap = true, silent = true, desc = "Jump to the top of the file" })

-- Bind E to jump to the bottom of the file
vim.keymap.set("n", "E", "G", { noremap = true, silent = true, desc = "Jump to the bottom of the file" })

-------------- Text Manipulation -----------------
-- Bind H to go into visual mode and highlight the entire current line
vim.keymap.set("n", "H", "V", { noremap = true, silent = true, desc = "Highlight the entire current line" })

-- Bind L to go into visual mode and highlight the entire current paragraph
vim.keymap.set("n", "L", "vip", { noremap = true, silent = true, desc = "Highlight the entire paragraph" })

-- Move highlighted text down with Shift+J in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted text down" })

-- Move highlighted text up with Shift+K in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move highlighted text up" })

-- Bind Ctrl + C to yank (in addition to y)

vim.keymap.set("n", "<C-c>", "yy", { noremap = true, silent = true, desc = "Yank current line" })
-- Yank writes to unnamed register and system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.fn.setreg("+", vim.fn.getreg('"')) -- Yank goes to both unnamed and system clipboard
  end,
})

-- Bind Shift+C to Section Comment Shortcuts
vim.keymap.set("n", "C", function()
  local lines = {
    "// ===============================",
    "// ",
    "// ===============================",
  }

  vim.api.nvim_put(lines, "l", true, true)
  vim.cmd("normal! kA")
end, { noremap = true, silent = true, desc = "Insert section comment structure" })

-- Delete ('d') only writes to the unnamed register
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without affecting system clipboard" })

-- Bind V to paste from the unnamed register (not from the system clipboard)
vim.keymap.set("n", "V", "p", { noremap = true, silent = true, desc = "Paste from unnamed register" })

-- Remap Ctrl + V to paste from system clipboard (not from the unnamed register)
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })

-- Bind Enter to insert a break line, move to the new line, and end in normal mode
vim.keymap.set(
  "n",
  "<CR>",
  "o<Esc>",
  { noremap = true, silent = true, desc = "Insert break line and stay in normal mode" }
)

-- Bind leader+s+r to in-file search and replace
vim.keymap.set(
  "n",
  "<leader>sr",
  ":%s/g<Left>",
  { noremap = true, silent = false, desc = "Search and replace in current file" }
)

-- Swap split directions for <leader>wv and <leader>ws
vim.keymap.set("n", "<leader>wv", "<C-w>s", { desc = "Split below (horizontal)" })
vim.keymap.set("n", "<leader>ws", "<C-w>v", { desc = "Split right (vertical)" })
vim.keymap.set("n", "<leader>wv", "<C-w>s", { desc = "Split below (horizontal)" })
vim.keymap.set("n", "<leader>ws", "<C-w>v", { desc = "Split right (vertical)" })
-------------- MISC -----------------

-- Binds Ctrl + n to toggle line numbers
vim.keymap.set("n", "<C-n>", ":set invnumber<CR>", { noremap = true, silent = true, desc = "Toggle line numbers" })

return{
-- Auto pairing

{ 'echasnovski/mini.pairs', version = false },

-- Commenting

{
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
}



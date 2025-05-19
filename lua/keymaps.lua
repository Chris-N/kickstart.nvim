-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('i', 'jk', '<Esc>')
-- VimScript way: vim.cmd("inoremap jk <Esc>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Configuration files
vim.keymap.set('n', '<leader>bb', ':vsplit ~/.bashrc<CR>', { desc = 'Bashrc config' })
vim.keymap.set('n', '<leader>bn', ':vsplit $MYVIMRC<CR>', { desc = 'Nvim config' })

-- Run ESLint and refresh file
vim.keymap.set('n', '<leader>ef', ':!npx eslint % --fix --no-warn-ignored<CR>:e!<CR>',
  { desc = '[E]slint [F]ix file', noremap = true })
vim.keymap.set('n', '<leader>ec', ':!npx eslint % --no-warn-ignored<CR>:e!<CR>', { desc = '[E]slint [C]heck file' })
vim.keymap.set('n', '<leader>ep', ':!npx eslint . --no-warn-ignored<CR>:e!<CR>', { desc = '[E]slint current [P]roject' })

-- Run Prettier & refresh file
vim.keymap.set('n', '<leader>p', ':!npx prettier % --write<CR>:e!<CR>', { desc = '[P]rettier current file' })

-- .NET Core Debug Keys
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { desc = 'Start/Continue Debugging' })
vim.keymap.set('n', '<F9>', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end, { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end, { desc = 'Step Out' })

-- TODO: Need to review keymaps default settings for DAP mappings
vim.keymap.set('n', '<Leader>b', function()
  require('dap').toggle_breakpoint()
end)
vim.keymap.set('n', '<Leader>B', function()
  require('dap').set_breakpoint()
end)
vim.keymap.set('n', '<Leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end)
vim.keymap.set('n', '<Leader>dr', function()
  require('dap').repl.open()
end)
vim.keymap.set('n', '<Leader>dl', function()
  require('dap').run_last()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end)

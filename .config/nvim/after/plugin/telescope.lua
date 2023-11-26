local builtin = require('telescope.builtin')
require('telescope').load_extension('fzf')

-- See `:help telescope.builtin`

vim.keymap.set('n', '<leader><F1>', builtin.help_tags, { desc = '[S]earch [H]elp'})

vim.keymap.set('n', '<leader>fp', builtin.oldfiles, { desc = '[F]ind [P]reviously opened files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find in Files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind in [G]it Files' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>gf', builtin.live_grep, { desc = '[G]rep [F]ind' })
vim.keymap.set('n', '<leader>gF', ':LiveGrepGitRoot<cr>', { desc = '[G]rep [F]ind on Git Root' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })


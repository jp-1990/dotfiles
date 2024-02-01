local builtin = require('telescope.builtin')
require('telescope').load_extension('fzf')

-- See `:help telescope.builtin`

vim.keymap.set('n', '<leader><F1>', builtin.help_tags, { desc = '[S]earch [H]elp'})

vim.keymap.set('n', '<leader>fp', builtin.oldfiles, { desc = '[F]ind [P]reviously opened files' })
vim.keymap.set('n', '<leader>fo', builtin.buffers, { desc = '[F]ind [O]pen buffers' })
vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = '[f/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind in [F]iles' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind with [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fb', builtin.git_branches, { desc = '[F]ind git [B]ranches' })
vim.keymap.set('n', '<leader>fc', builtin.git_bcommits, { desc = '[F]ind git [C]commits for current buffer' })


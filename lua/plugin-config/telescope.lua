-- Find files using lua fuctions
local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap('n', '<leader>ff', '<Cmd>lua require(\'telescope.builtin\').find_files()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<Cmd>lua require(\'telescope.builtin\').live_grep()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<Cmd>lua require(\'telescope.builtin\').buffers()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<Cmd>lua require(\'telescope.builtin\').help_tags()<CR>', opts)

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        -- program to use for searching with its arguments
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        -- prompt_position = 'top', -- have prompt at the top (has no effect on vertical configuration)
        prompt_prefix = ' ', -- symbol on prompt window
        selection_caret = ' ', -- symbol on selected row in results window
        entry_prefix = '  ', -- symbol on non-selected rows in results window
        initial_mode = 'insert', -- start in insert mode
        selection_strategy = 'reset', -- what happens to selection when list changes
        sorting_strategy = 'ascending', -- start with most important search on top
        layout_strategy = 'vertical', -- vertical layout
        layout_config = {
            vertical = {
                mirror = true, -- windows should be in this order from top to bottom: search, results, preview
                preview_height = 0.5 -- preview window takes 0.5 of the total window height
            }
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {'node_modules/.*'}, -- never search in node_modules/ dir
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        display_path = true,
        winblend = 0, -- window should not be transparent
        border = {}, -- no border?
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}, -- border chars
        color_devicons = true, -- colorize used icons
        use_less = true, -- less is bash program for preview file contents
        set_env = {['COLORTERM'] = 'truecolor'}, -- use all the colors
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        -- preview_cutoff = 120,
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_next,
                ['<C-l>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ['ć'] = actions.close,
                ['<CR>'] = actions.select_default + actions.center,
            },
            n = {
                ['<C-k>'] = actions.move_selection_next,
                ['<C-l>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['ć'] = actions.close,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

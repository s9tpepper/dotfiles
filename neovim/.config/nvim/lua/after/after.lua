vim.cmd [[
  " TODO: Figure out how to remove this link NONE
  highlight link @punctuation.bracket.php NONE

  highlight PhpTagCustom guifg=#ff77ff ctermfg=red
  syntax match PhpTagCustom "<?php" containedin=phpRegion
  syntax keyword PhpTagCustom "<?php"
  autocmd FileType php syntax match PhpTagCustom "<?php"

  " Apply custom settings after the color scheme is loaded
  " augroup CustomHighlight
  "   autocmd!
  "   autocmd ColorScheme * highlight PhpTagCustom guifg=#ff77ff ctermfg=red
  "   autocmd ColorScheme * syntax match PhpTagCustom "<?php" contained
  "   " autocmd ColorScheme * highlight link @punctuation.bracket.php NONE
  " augroup END
]]

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })

-- Customize gutter to use symbols, absolute line numbers, and relative line numbers
vim.o.statuscolumn = '%s %l %r'

-- Adjust the width of the number column
vim.opt.numberwidth = 7 -- Default is 4. Increase for more padding.

local aml_opts = {
  pattern = '*.aml',
  callback = function()
    vim.cmd 'setfiletype anathema'
  end,
}
vim.api.nvim_create_autocmd('BufReadPost', aml_opts)

-- Pad line numbers with spaces for right alignment
-- vim.opt.relativenumber = true
-- vim.opt.number = true
-- vim.api.nvim_set_option('numberwidth', 8) -- Ensure the column is wide enough

-- NOTE: Code below this line is a WIP, trying to figure out how to show absolute line numbers
-- on the right side of the buffer using virtual text
--
-- Custom right-align numbers with padding
-- local function format_numbers()
--   local max_width = vim.opt.numberwidth:get()
--   vim.wo.relativenumber = true
--   vim.wo.number = true
--
--   vim.cmd [[
--     augroup AlignNumbers
--       autocmd!
--       autocmd BufEnter,WinEnter,CursorMoved * call v:lua.AlignLineNumbers()
--     augroup END
--   ]]
-- end
--
-- function _G.AlignLineNumbers()
--   local max_digits = 4 -- Maximum number of digits to pad for
-- end
--
-- format_numbers()
--

-- Create a namespace for virtual text
-- local ns_id = vim.api.nvim_create_namespace 'absolute_line_numbers'
--
-- -- Function to clear any existing extmarks in the buffer
-- local function clear_extmarks()
--   vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
-- end
--
-- -- Function to display absolute line numbers on the right side
-- local function show_absolute_line_numbers()
--   --- start debugging
--   local bufnr = vim.api.nvim_get_current_buf()
--   local filetype = vim.bo.filetype
--
--   vim.wo.number = true
--   vim.wo.relativenumber = true
--   vim.wo.cursorline = true
--
--   print('Filetype: ' .. filetype) -- Debugging
--   vim.api.nvim_buf_set_extmark(bufnr, ns_id, 0, 0, {
--     virt_text = { { '123', 'NonText' } },
--     virt_text_pos = 'eol', -- Make sure this is correct
--   })
--
--   --- end debugging
--
--   -- Get the current window width
--   local win_width = vim.api.nvim_win_get_width(0)
--
--   -- Get the total number of lines in the buffer
--   local lines = vim.api.nvim_buf_line_count(0)
--
--   -- Clear any existing extmarks (virtual text)
--   clear_extmarks()
--
--   -- Iterate through each line in the buffer
--   for i = 0, lines - 1 do
--     local line_num = tostring(i + 1) -- Absolute line number
--
--     -- Calculate the number of spaces to pad on the right side
--     local line_text = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1] or ''
--     local line_length = vim.fn.strwidth(line_text)
--
--     -- Calculate remaining space on the right
--     local padding = win_width - line_length - vim.fn.strwidth(line_num)
--
--     -- Ensure there's enough space to place the number
--     if padding >= 0 then
--       -- Create the virtual text: spaces followed by the line number
--       -- Subtract 4 from padding to give the numbers space, otherwise they fall off the edge of the screen
--       local virt_text = string.rep(' ', padding - 4) .. line_num
--
--       -- Set the virtual text at the end of the line (eol)
--       vim.api.nvim_buf_set_extmark(0, ns_id, i, 0, {
--         virt_text = { { virt_text, 'NonText' } },
--         virt_text_pos = 'eol', -- Ensure text appears at the end of the line
--       })
--     end
--   end
-- end
--
-- -- Autocommand group to handle relevant events
-- vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinScrolled', 'TextChanged', 'CursorMoved', 'WinResized' }, {
--   group = vim.api.nvim_create_augroup('AbsoluteLineNumbers', { clear = true }),
--   callback = show_absolute_line_numbers,
-- })
--
-- vim.api.nvim_create_augroup('AbsoluteLineNumbers', { clear = true })
-- vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinScrolled', 'TextChanged', 'CursorMoved', 'WinResized' }, {
--   group = 'AbsoluteLineNumbers',
--   pattern = '*',
--   callback = show_absolute_line_numbers,
-- })
--
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'TextChanged', 'TextChangedI', 'CursorMoved', 'VimEnter' }, {
--   pattern = '*',
--   callback = show_absolute_line_numbers,
-- })
--
-- print 'Absolute line numbers loaded'
--
--
--
--
--

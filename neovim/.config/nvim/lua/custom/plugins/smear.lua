return {
  'sphamba/smear-cursor.nvim',
  opts = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.cmd 'SmearCursorToggle'
      end,
    })
    vim.api.nvim_create_autocmd('BufWritePost', {
      callback = function()
        -- vim.cmd 'SmearCursorToggle'

        vim.defer_fn(function()
          vim.cmd 'SmearCursorToggle'
        end, 5) -- delay 50ms
      end,
    })

    return {
      -- Smear cursor when switching buffers or windows. default: true
      smear_between_buffers = false,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds. default: false
      legacy_computing_symbols_support = true,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,

      smear_to_cmd = false, -- default: true
    }
  end,
}

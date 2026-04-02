vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.updated then
      require('fff.download').download_or_build_binary()
    end
  end,
})

-- the plugin will automatically lazy load
vim.g.fff = {
  lazy_sync = true, -- start syncing only when the picker is open
  debug = {
    enabled = true,
    show_scores = true,
  },
}

vim.keymap.set(
  'n',
  'ff',
  function() require('fff').find_files() end,
  { desc = 'FFFind files' }
)

vim.keymap.set(
  'n',
  'fg',
  function() require('fff').live_grep() end,
  { desc = 'LiFFFe grep' }
)

vim.keymap.set(
  'n',
  'fz',
  function ()
    require('fff').live_grep({
      grep = {
        modes = {'fuzzy', 'plain'}
      }
    })
  end,
  { desc = 'Live fffuzy grep' }
)

vim.keymap.set(
  'n',
  'fc',
  function ()
    require('fff').live_grep({ query = vim.fn.expand("<cword>") })
  end,
  { desc = 'Search current word' }
)

require('fff').setup({
    base_path = vim.fn.getcwd(),
    prompt = '🪿 ',
    title = 'FFFiles',
    max_results = 100,
    max_threads = 4,
    lazy_sync = true, -- set to false if you want file indexing to start on open
    layout = {
      height = 0.8,
      width = 0.8,
      prompt_position = 'bottom', -- or 'top'
      preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
      preview_size = 0.5,
      flex = { -- set to false to disable flex layout
        size = 130, -- column threshold: if screen width >= size, use preview_position; otherwise use wrap
        wrap = 'top', -- position to use when screen is narrower than size
      },
      show_scrollbar = true, -- Show scrollbar for pagination
      -- How to shorten long directory paths in the file list:
      -- 'middle_number' (default): uses dots for 1-3 hidden (a/./b, a/../b, a/.../b)
      --                            and numbers for 4+ (a/.4./b, a/.5./b)
      -- 'middle': always uses dots (a/./b, a/../b, a/.../b)
      -- 'end': truncates from the end (home/user/projects)
      path_shorten_strategy = 'middle_number',
    },
    preview = {
      enabled = true,
      max_size = 10 * 1024 * 1024, -- Do not try to read files larger than 10MB
      chunk_size = 8192, -- Bytes per chunk for dynamic loading (8kb - fits ~100-200 lines)
      binary_file_threshold = 1024, -- amount of bytes to scan for binary content (set 0 to disable)
      imagemagick_info_format_str = '%m: %wx%h, %[colorspace], %q-bit',
      line_numbers = false,
      cursorlineopt = 'both', -- the cursorlineopt used for lines in grep file previews, see :h cursorlineopt
      wrap_lines = false,
      filetypes = {
        svg = { wrap_lines = true },
        markdown = { wrap_lines = true },
        text = { wrap_lines = true },
      },
    },
    keymaps = {
      close = '<Esc>',
      select = '<CR>',
      select_split = '<C-s>',
      select_vsplit = '<C-v>',
      select_tab = '<C-t>',
      -- you can assign multiple keys to any action
      move_up = { '<Up>', '<C-p>' },
      move_down = { '<Down>', '<C-n>' },
      preview_scroll_up = '<C-u>',
      preview_scroll_down = '<C-d>',
      toggle_debug = '<F2>',
      -- grep mode: cycle between plain text, regex, and fuzzy search
      cycle_grep_modes = '<S-Tab>',
      -- goes to the previous query in history
      cycle_previous_query = '<C-Up>',
      -- multi-select keymaps for quickfix
      toggle_select = '<Tab>',
      send_to_quickfix = '<C-q>',
      -- this are specific for the normal mode (you can exit it using any other keybind like jj)
      focus_list = '<leader>l',
      focus_preview = '<leader>p',
    },
    hl = {
      border = 'FloatBorder',
      normal = 'Normal',
      cursor = 'CursorLine',  -- Falls back to 'Visual' if CursorLine is not defined
      matched = 'IncSearch',
      title = 'Title',
      prompt = 'Question',
      frecency = 'Number',
      debug = 'Comment',
      combo_header = 'Number',
      scrollbar = 'Comment',
      directory_path = 'Comment',
      -- Multi-select highlights
      selected = 'FFFSelected',
      selected_active = 'FFFSelectedActive',
      -- Git text highlights for file names
      git_staged = 'FFFGitStaged',
      git_modified = 'FFFGitModified',
      git_deleted = 'FFFGitDeleted',
      git_renamed = 'FFFGitRenamed',
      git_untracked = 'FFFGitUntracked',
      git_ignored = 'FFFGitIgnored',
      -- Git sign/border highlights
      git_sign_staged = 'FFFGitSignStaged',
      git_sign_modified = 'FFFGitSignModified',
      git_sign_deleted = 'FFFGitSignDeleted',
      git_sign_renamed = 'FFFGitSignRenamed',
      git_sign_untracked = 'FFFGitSignUntracked',
      git_sign_ignored = 'FFFGitSignIgnored',
      -- Git sign selected highlights
      git_sign_staged_selected = 'FFFGitSignStagedSelected',
      git_sign_modified_selected = 'FFFGitSignModifiedSelected',
      git_sign_deleted_selected = 'FFFGitSignDeletedSelected',
      git_sign_renamed_selected = 'FFFGitSignRenamedSelected',
      git_sign_untracked_selected = 'FFFGitSignUntrackedSelected',
      git_sign_ignored_selected = 'FFFGitSignIgnoredSelected',
      -- Grep highlights
      grep_match = 'IncSearch',               -- Highlight for matched text in grep results
      grep_line_number = 'LineNr',            -- Highlight for :line:col location
      grep_regex_active = 'DiagnosticInfo',   -- Highlight for keybind + label when regex is on
      grep_plain_active = 'Comment',        -- Highlight for keybind + label when regex is off
      grep_fuzzy_active = 'DiagnosticHint',   -- Highlight for keybind + label when fuzzy is on
      -- Cross-mode suggestion highlights
      suggestion_header = 'WarningMsg', -- Highlight for the "No results found. Suggested..." banner
    },
    -- Store file open frecency
    frecency = {
      enabled = true,
      db_path = vim.fn.stdpath('cache') .. '/fff_nvim',
    },
    -- Store successfully opened queries with respective matches
    history = {
      enabled = true,
      db_path = vim.fn.stdpath('data') .. '/fff_queries',
      min_combo_count = 3, -- Minimum selections before combo boost applies (3 = boost starts on 3rd selection)
      combo_boost_score_multiplier = 100, -- Score multiplier for combo matches (files repeatedly opened with same query)
    },
    -- Git integration
    git = {
      status_text_color = false, -- Apply git status colors to filename text (default: false, only sign column)
    },
    debug = {
      enabled = false, -- Show file info panel in preview
      show_scores = false, -- Show scores inline in the UI
    },
    logging = {
      enabled = true,
      log_file = vim.fn.stdpath('log') .. '/fff.log',
      log_level = 'info',
    },
    -- find_files settings
    file_picker = {
      current_file_label = '(current)',
    },
    -- grep settings
    grep = {
      max_file_size = 10 * 1024 * 1024, -- Skip files larger than 10MB
      max_matches_per_file = 100, -- Maximum matches per file (set 0 to unlimited)
      smart_case = true, -- Case-insensitive unless query has uppercase
      time_budget_ms = 150, -- Max search time in ms per call (prevents UI freeze, 0 = no limit)
      modes = { 'plain', 'regex', 'fuzzy' }, -- Available grep modes and their cycling order
    },
  })

local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

-- local theme = {
--   normal = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.white },
--     z = { fg = colors.white, bg = colors.black },
--   },
--   insert = { a = { fg = colors.black, bg = colors.light_green } },
--   visual = { a = { fg = colors.black, bg = colors.orange } },
--   replace = { a = { fg = colors.black, bg = colors.green } },
-- }

-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    -- for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
    --   table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    -- end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg '/'
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

local mode_map = {
  ['n'] = ' NORMAL',
  ['no'] = ' O-PENDING',
  ['nov'] = ' O-PENDING',
  ['noV'] = ' O-PENDING',
  ['noCTRL-V'] = ' O-PENDING',
  ['niI'] = ' NORMAL',
  ['niR'] = ' NORMAL',
  ['niV'] = ' NORMAL',
  ['nt'] = ' NORMAL',
  ['v'] = ' VISUAL',
  ['vs'] = ' VISUAL',
  ['V'] = ' V-LINE',
  ['Vs'] = ' V-LINE',
  ['CTRL-V'] = ' V-BLOCK',
  ['CTRL-Vs'] = ' V-BLOCK',
  ['s'] = ' SELECT',
  ['S'] = ' S-LINE',
  ['CTRL-S'] = ' S-BLOCK',
  ['i'] = ' INSERT',
  ['ic'] = ' INSERT',
  ['ix'] = ' INSERT',
  ['R'] = ' REPLACE',
  ['Rc'] = ' REPLACE',
  ['Rx'] = ' REPLACE',
  ['Rv'] = ' V-REPLACE',
  ['Rvc'] = ' V-REPLACE',
  ['Rvx'] = ' V-REPLACE',
  ['c'] = ' COMMAND',
  ['cv'] = ' EX',
  ['ce'] = ' EX',
  ['r'] = ' REPLACE',
  ['rm'] = ' MORE',
  ['r?'] = ' CONFIRM',
  ['!'] = ' SHELL',
  ['t'] = ' TERMINAL',
}

return {
  -- theme = 'catppuccin',
  options = {
    theme = 'catppuccin',
    component_separators = '',
    disabled_filetypes = { 'NvimTree' },
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    -- lualine_a = { 'mode' },
    lualine_a = {
      function()
        return mode_map[vim.api.nvim_get_mode().mode] or ''
      end,
    },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        require('noice').api.status.mode.get,
        cond = require('noice').api.status.mode.has,
        color = { fg = '#ff9e64' },
      },
    },
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}

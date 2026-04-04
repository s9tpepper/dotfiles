-- latte, frappe, macchiato, mocha
local theme_flavor = 'macchiato'

-- Controls how LSP semantic tokens interact with treesitter highlights.
-- Semantic tokens from LSPs (like ts_ls) override treesitter highlight groups,
-- which can make custom treesitter colors appear to have no effect.
--   'disable' = clear all @lsp.type.* highlights, let treesitter control everything
--   'match'   = map @lsp.type.* to the same colors as their treesitter counterparts
local semantic_token_mode = 'match'

return {
  flavour = theme_flavor,
  background = { -- :h background
    light = theme_flavor,
    dark = theme_flavor,
  },
  transparent_background = true, -- disables setting the background color.
  float = {
    transparent = true,
    solid = true,
  },
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = 'dark',
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { 'italic' }, -- Change the style of comments
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  -- Catppuccin Mocha palette colors available via the `colors` parameter:
  --   rosewater = "#f5e0dc"  flamingo  = "#f2cdcd"  pink     = "#f5c2e7"
  --   mauve     = "#cba6f7"  red       = "#f38ba8"  maroon   = "#eba0ac"
  --   peach     = "#fab387"  yellow    = "#f9e2af"  green    = "#a6e3a1"
  --   teal      = "#94e2d5"  sky       = "#89dceb"  sapphire = "#74c7ec"
  --   blue      = "#89b4fa"  lavender  = "#b4befe"  text     = "#cdd6f4"
  --   subtext1  = "#bac2de"  subtext0  = "#a6adc8"  overlay2 = "#9399b2"
  --   overlay1  = "#7f849c"  overlay0  = "#6c7086"  surface2 = "#585b70"
  --   surface1  = "#45475a"  surface0  = "#313244"  base     = "#1e1e2e"
  --   mantle    = "#181825"  crust     = "#11111b"
  --
  -- Note: "link" means the group inherits from another group.
  -- To override a linked group, replace { link = "..." } with { fg = colors.xxx }.
  -- The `styles` entries (e.g. styles.keywords) reference the `styles = {}` table above.
  custom_highlights = function(colors)
    -- stylua: ignore
    return {
      ---------------------------------------------------------------------------
      -- Identifiers
      -- oxocarbon uses light gray for most variables; we keep catppuccin more
      -- colorful here since we already changed @variable from plain text.
      ---------------------------------------------------------------------------
      ['@variable'] = { fg = colors.sky },                              -- default: text | oxo: base04 (gray) — any variable name
      ['@variable.builtin'] = { fg = colors.red },                -- default: red | oxo: base04 (gray) — self, this, cls
      ['@variable.parameter'] = { fg = colors.maroon },           -- default: maroon | oxo: base04 (gray) — function parameters
      ['@variable.member'] = { fg = colors.teal },                -- default: lavender | oxo: base04 (gray) — object fields (foo.bar)

      ['@constant'] = { fg = colors.peach },                      -- default: link Constant (peach) | oxo: base14 (purple) — named constants
      ['@constant.builtin'] = { fg = colors.teal },               -- default: peach | oxo: base07 (teal) — nil, undefined, NULL
      ['@constant.macro'] = { fg = colors.teal },                 -- default: link Macro (mauve) | oxo: base07 (teal) — macro-defined constants

      ['@module'] = { fg = colors.teal },                         -- default: yellow | oxo: base07 (teal) — modules/namespaces
      ['@label'] = { fg = colors.sky },                           -- default: link Label (sapphire) | oxo: base15 (sky) — labels

      ---------------------------------------------------------------------------
      -- Literals
      ---------------------------------------------------------------------------
      ['@string'] = { link = 'String' },                          -- default: link String (green) | oxo: base14 (purple) — string literals
      ['@string.documentation'] = { fg = colors.teal },           -- default: teal | oxo: (inherits) — docstrings
      ['@string.regexp'] = { fg = colors.teal },                  -- default: pink | oxo: base07 (teal) — regex patterns
      ['@string.escape'] = { fg = colors.sky },                   -- default: pink | oxo: base15 (sky) — escape chars (\n, \t)
      ['@string.special'] = { link = 'Special' },                 -- default: link Special (pink) | oxo: (inherits) — special strings
      ['@string.special.path'] = { link = 'Special' },            -- default: link Special (pink) | oxo: (inherits) — file paths
      ['@string.special.symbol'] = { fg = colors.flamingo },      -- default: flamingo | oxo: (inherits) — symbols/atoms
      ['@string.special.url'] = { fg = colors.blue },             -- default: blue | oxo: (inherits) — urls/links

      ['@character'] = { link = 'Character' },                    -- default: link Character (teal) | oxo: base14 (purple) — char literals
      ['@character.special'] = { link = 'SpecialChar' },          -- default: link SpecialChar (pink) | oxo: (inherits) — special chars

      ['@boolean'] = { fg = colors.blue },                        -- default: link Boolean (peach) | oxo: base09 (blue) — true/false
      ['@number'] = { fg = colors.sapphire },                     -- default: link Number (peach) | oxo: base15 (sky) — number literals
      ['@number.float'] = { fg = colors.sapphire },               -- default: link Float (peach) | oxo: base15 (sky) — floats

      ---------------------------------------------------------------------------
      -- Types
      ---------------------------------------------------------------------------
      ['@type'] = { link = 'Type' },                              -- default: link Type (yellow) | oxo: base09 (blue) — type names
      ['@type.builtin'] = { fg = colors.mauve },                  -- default: mauve | oxo: base09 (blue) — built-in types
      ['@type.definition'] = { link = 'Type' },                   -- default: link Type (yellow) | oxo: (inherits) — typedef

      ['@attribute'] = { fg = colors.sky },                       -- default: link Constant (peach) | oxo: base15 (sky) — decorators
      ['@property'] = { fg = colors.pink },                       -- default: lavender | oxo: base10 (magenta) — object properties

      ---------------------------------------------------------------------------
      -- Functions
      -- oxocarbon uses pink for functions and teal for methods, creating
      -- strong visual distinction. We mirror that pattern here.
      ---------------------------------------------------------------------------
      ['@function'] = { fg = colors.pink, style = { 'bold' } },  -- default: link Function (blue) | oxo: base12 (pink, bold) — function defs
      ['@function.builtin'] = { fg = colors.pink },               -- default: peach | oxo: base12 (pink) — built-in functions
      ['@function.call'] = { fg = colors.pink },                  -- default: link Function (blue) | oxo: base12 (pink) — function calls
      ['@function.macro'] = { fg = colors.teal },                 -- default: pink | oxo: base07 (teal) — macro functions

      ['@function.method'] = { fg = colors.teal },                -- default: link Function (blue) | oxo: base07 (teal) — method definitions
      ['@function.method.call'] = { fg = colors.teal },           -- default: link Function (blue) | oxo: base07 (teal) — method calls

      ['@constructor'] = { fg = colors.sapphire },                -- default: yellow | oxo: base09 (blue) — constructors
      ['@operator'] = { fg = colors.sky },                        -- default: link Operator (sky) | oxo: base09 (blue) — operators

      ---------------------------------------------------------------------------
      -- Keywords
      -- oxocarbon uses blue for most keywords but cyan for keyword.function
      -- and keyword.operator. We split mauve/sky to add variety.
      ---------------------------------------------------------------------------
      ['@keyword'] = { link = 'Keyword' },                        -- default: link Keyword (mauve) | oxo: base09 (blue) — general keywords
      ['@keyword.modifier'] = { link = 'Keyword' },               -- default: link Keyword (mauve) | oxo: base09 (blue) — const, static
      ['@keyword.type'] = { link = 'Keyword' },                   -- default: link Keyword (mauve) | oxo: base09 (blue) — struct, enum
      ['@keyword.coroutine'] = { fg = colors.sky },               -- default: link Keyword (mauve) | oxo: base08 (cyan) — async, await
      ['@keyword.function'] = { fg = colors.sky },                -- default: mauve | oxo: base08 (cyan) — function/fn/def keyword
      ['@keyword.operator'] = { fg = colors.sky },                -- default: mauve | oxo: base08 (cyan) — new, typeof, instanceof
      ['@keyword.import'] = { link = 'Include' },                 -- default: link Include (mauve) | oxo: base09 (blue) — import, require
      ['@keyword.repeat'] = { link = 'Repeat' },                  -- default: link Repeat (mauve) | oxo: base09 (blue) — for, while
      ['@keyword.return'] = { fg = colors.mauve },                -- default: mauve | oxo: base09 (blue) — return
      ['@keyword.debug'] = { link = 'Exception' },                -- default: link Exception (mauve) | oxo: (inherits) — debugger
      ['@keyword.exception'] = { fg = colors.sky },               -- default: link Exception (mauve) | oxo: base15 (sky) — try, catch, throw

      ['@keyword.conditional'] = { link = 'Conditional' },        -- default: link Conditional (mauve) | oxo: base09 (blue) — if, else
      ['@keyword.conditional.ternary'] = { link = 'Operator' },   -- default: link Operator (sky) | oxo: (inherits) — ? :

      ['@keyword.directive'] = { link = 'PreProc' },              -- default: link PreProc (pink) | oxo: (inherits) — preprocessor
      ['@keyword.directive.define'] = { link = 'Define' },        -- default: link Define (pink) | oxo: (inherits) — #define
      ['@keyword.export'] = { fg = colors.mauve },                -- default: mauve | oxo: base09 (blue) — export keyword

      ---------------------------------------------------------------------------
      -- Punctuation
      -- oxocarbon uses bright cyan for ALL punctuation — a big reason it
      -- looks more colorful. We use teal for a similar effect.
      ---------------------------------------------------------------------------
      ['@punctuation.delimiter'] = { fg = colors.teal },          -- default: overlay2 | oxo: base08 (cyan) — ; . ,
      ['@punctuation.bracket'] = { fg = colors.teal },            -- default: overlay2 | oxo: base08 (cyan) — ( ) [ ] { }
      ['@punctuation.special'] = { fg = colors.teal },            -- default: link Special (pink) | oxo: base08 (cyan) — ${} interpolation

      ---------------------------------------------------------------------------
      -- Comments
      ---------------------------------------------------------------------------
      ['@comment'] = { link = 'Comment' },                        -- default: link Comment (overlay2, italic) — comments
      ['@comment.documentation'] = { link = 'Comment' },          -- default: link Comment (overlay2, italic) — doc comments

      ['@comment.error'] = { fg = colors.base, bg = colors.red },       -- default: base on red
      ['@comment.warning'] = { fg = colors.base, bg = colors.yellow },  -- default: base on yellow
      ['@comment.hint'] = { fg = colors.base, bg = colors.blue },       -- default: base on blue
      ['@comment.todo'] = { fg = colors.base, bg = colors.flamingo },   -- default: base on flamingo
      ['@comment.note'] = { fg = colors.base, bg = colors.rosewater },  -- default: base on rosewater

      ---------------------------------------------------------------------------
      -- Markup (markdown, HTML, etc.)
      ---------------------------------------------------------------------------
      ['@markup'] = { fg = colors.text },                         -- default: text — plain markup text
      ['@markup.strong'] = { fg = colors.red },                   -- default: red, bold — **bold**
      ['@markup.italic'] = { fg = colors.red },                   -- default: red, italic — *italic*
      ['@markup.strikethrough'] = { fg = colors.text },           -- default: text, strikethrough — ~~struck~~
      ['@markup.underline'] = { link = 'Underlined' },            -- default: link Underlined — underlined text

      ['@markup.heading'] = { fg = colors.blue },                 -- default: blue — headings
      ['@markup.math'] = { fg = colors.blue },                    -- default: blue — math
      ['@markup.quote'] = { fg = colors.pink },                   -- default: pink — block quotes
      ['@markup.environment'] = { fg = colors.pink },             -- default: pink — LaTeX environments
      ['@markup.environment.name'] = { fg = colors.blue },        -- default: blue — environment names

      ['@markup.link'] = { fg = colors.lavender },                -- default: lavender — references
      ['@markup.link.label'] = { fg = colors.lavender },          -- default: lavender — link descriptions
      ['@markup.link.url'] = { fg = colors.blue },                -- default: blue, italic+underline — URLs

      ['@markup.raw'] = { fg = colors.green },                    -- default: green — inline code
      ['@markup.list'] = { fg = colors.teal },                    -- default: teal — list markers
      ['@markup.list.checked'] = { fg = colors.green },           -- default: green — [x] checked
      ['@markup.list.unchecked'] = { fg = colors.overlay1 },      -- default: overlay1 — [ ] unchecked

      ---------------------------------------------------------------------------
      -- Diff
      ---------------------------------------------------------------------------
      ['@diff.plus'] = { link = 'diffAdded' },                   -- default: link diffAdded (green) — added lines
      ['@diff.minus'] = { link = 'diffRemoved' },                -- default: link diffRemoved (red) — removed lines
      ['@diff.delta'] = { link = 'diffChanged' },                -- default: link diffChanged (blue) — changed lines

      ---------------------------------------------------------------------------
      -- Tags (HTML/JSX)
      ---------------------------------------------------------------------------
      ['@tag'] = { fg = colors.blue },                            -- default: blue | oxo: base09 (blue) — tag names
      ['@tag.builtin'] = { fg = colors.blue },                    -- default: blue | oxo: base09 (blue) — built-in tags
      ['@tag.attribute'] = { fg = colors.sky },                   -- default: yellow | oxo: base15 (sky) — attributes
      ['@tag.delimiter'] = { fg = colors.teal },                  -- default: teal | oxo: base15 (sky) — < > /

      ---------------------------------------------------------------------------
      -- Language-specific overrides
      ---------------------------------------------------------------------------
      -- Bash
      ['@function.builtin.bash'] = { fg = colors.red },           -- default: red, italic
      ['@variable.parameter.bash'] = { fg = colors.green },       -- default: green

      -- CSS
      ['@property.css'] = { fg = colors.blue },                   -- default: blue
      ['@property.scss'] = { fg = colors.blue },                  -- default: blue
      ['@property.id.css'] = { fg = colors.yellow },              -- default: yellow
      ['@property.class.css'] = { fg = colors.yellow },           -- default: yellow
      ['@type.css'] = { fg = colors.lavender },                   -- default: lavender
      ['@type.tag.css'] = { fg = colors.blue },                   -- default: blue
      ['@string.plain.css'] = { fg = colors.text },               -- default: text
      ['@number.css'] = { fg = colors.peach },                    -- default: peach
      ['@keyword.directive.css'] = { link = 'Keyword' },          -- default: link Keyword (mauve)

      -- HTML
      ['@string.special.url.html'] = { fg = colors.green },      -- default: green — href/src URLs
      ['@markup.link.label.html'] = { fg = colors.text },         -- default: text — text inside <a> tags
      ['@character.special.html'] = { fg = colors.red },          -- default: red — &nbsp; entities

      -- Lua
      ['@constructor.lua'] = { link = '@punctuation.bracket' },   -- default: link @punctuation.bracket — {} in Lua

      -- Python
      ['@constructor.python'] = { fg = colors.sky },              -- default: sky — __init__(), __new__()

      -- PHP
      ['@function.method.php'] = { fg = colors.teal },            -- default: link Function (blue) — follows method color
      ['@function.method.call.php'] = { fg = colors.teal },       -- default: link Function (blue) — follows method color

      -- C/C++
      ['@keyword.import.c'] = { fg = colors.yellow },             -- default: yellow — #include
      ['@keyword.import.cpp'] = { fg = colors.yellow },           -- default: yellow — #include

      -- C#
      ['@attribute.c_sharp'] = { fg = colors.yellow },            -- default: yellow

      -- Java
      ['@constant.java'] = { fg = colors.teal },                  -- default: teal

      -- YAML
      ['@label.yaml'] = { fg = colors.yellow },                   -- default: yellow

      -- Ruby
      ['@string.special.symbol.ruby'] = { fg = colors.flamingo }, -- default: flamingo

      -- gitcommit
      ['@comment.warning.gitcommit'] = { fg = colors.yellow },    -- default: yellow

      -- gitignore
      ['@string.special.path.gitignore'] = { fg = colors.text },  -- default: text

      ---------------------------------------------------------------------------
      -- LSP Semantic Token highlights
      -- These @lsp.type.* groups override treesitter highlights when an LSP
      -- (like ts_ls) provides semantic tokens. Controlled by semantic_token_mode
      -- variable at the top of this file:
      --   'disable' = {} clears them, treesitter controls all highlighting
      --   'match'   = mirrors treesitter colors so semantic tokens stay active
      --              but use the same palette as the treesitter groups above
      ---------------------------------------------------------------------------
      ['@lsp.type.variable'] = semantic_token_mode == 'disable' and {} or { fg = colors.sky },                  -- treesitter: @variable
      ['@lsp.type.parameter'] = semantic_token_mode == 'disable' and {} or { fg = colors.maroon },              -- treesitter: @variable.parameter
      ['@lsp.type.property'] = semantic_token_mode == 'disable' and {} or { fg = colors.pink },                 -- treesitter: @property
      ['@lsp.type.function'] = semantic_token_mode == 'disable' and {} or { fg = colors.pink, style = { 'bold' } }, -- treesitter: @function
      ['@lsp.type.method'] = semantic_token_mode == 'disable' and {} or { fg = colors.teal },                   -- treesitter: @function.method
      ['@lsp.type.member'] = semantic_token_mode == 'disable' and {} or { fg = colors.teal },                   -- treesitter: @function.method — JS object members/method calls
      ['@lsp.type.class'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },                  -- treesitter: @type (Type)
      ['@lsp.type.enum'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },                   -- treesitter: @type (Type)
      ['@lsp.type.interface'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },              -- treesitter: @type (Type)
      ['@lsp.type.struct'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },                 -- treesitter: @type (Type)
      ['@lsp.type.namespace'] = semantic_token_mode == 'disable' and {} or { fg = colors.teal },                -- treesitter: @module
      ['@lsp.type.type'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },                   -- treesitter: @type (Type)
      ['@lsp.type.typeParameter'] = semantic_token_mode == 'disable' and {} or { fg = colors.yellow },          -- treesitter: @type (Type)
      ['@lsp.type.enumMember'] = semantic_token_mode == 'disable' and {} or { fg = colors.peach },              -- treesitter: @constant
      ['@lsp.type.decorator'] = semantic_token_mode == 'disable' and {} or { fg = colors.sky },                 -- treesitter: @attribute
      ['@lsp.type.keyword'] = semantic_token_mode == 'disable' and {} or { fg = colors.mauve },                 -- treesitter: @keyword (Keyword)
      ['@lsp.type.modifier'] = semantic_token_mode == 'disable' and {} or { fg = colors.mauve },                -- treesitter: @keyword.modifier
      ['@lsp.type.comment'] = semantic_token_mode == 'disable' and {} or { link = 'Comment' },                  -- treesitter: @comment
      ['@lsp.type.string'] = semantic_token_mode == 'disable' and {} or { link = 'String' },                    -- treesitter: @string
      ['@lsp.type.number'] = semantic_token_mode == 'disable' and {} or { fg = colors.sapphire },               -- treesitter: @number
      ['@lsp.type.regexp'] = semantic_token_mode == 'disable' and {} or { fg = colors.teal },                   -- treesitter: @string.regexp
      ['@lsp.type.operator'] = semantic_token_mode == 'disable' and {} or { fg = colors.sky },                  -- treesitter: @operator
      ['@lsp.type.event'] = semantic_token_mode == 'disable' and {} or { fg = colors.sky },                     -- treesitter: @variable
      ['@lsp.type.macro'] = semantic_token_mode == 'disable' and {} or { fg = colors.teal },                    -- treesitter: @function.macro
-- Semantic Tokens
--   - @lsp.type.member.javascript links to @lsp   priority: 125
--
-- Extmarks
--   - LspReferenceRead nvim.lsp.references
--   - LspReferenceRead nvim.lsp.references
    }
  end,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    harpoon = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = '',
    },
    neogit = false,
    dap = true,
    dap_ui = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
      inlay_hints = {
        background = true,
      },
    },
    lsp_trouble = true,
    mason = true,
    lualine = {},
    telescope = {
      enabled = true,
    },
    which_key = true,
  },
}

-- overriding default options
local opt = vim.opt
local g = vim.g


-- use spaces instead of tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true


-- terminal colors (https://github.com/neovim/neovim/issues/2897#issuecomment-115464516 modified)
g.terminal_color_0  = '#2e3436'

-- g.terminal_color_1  = '#cc0000'
g.terminal_color_1  = '#D14833'

-- g.terminal_color_2  = '#4e9a06'
g.terminal_color_2  = '#47C43C'

g.terminal_color_3  = '#c4a000'

-- g.terminal_color_4  = '#3465a4'
g.terminal_color_4  = '#6749F0'

-- g.terminal_color_5  = '#75507b'
g.terminal_color_5  = '#E051DD'

g.terminal_color_6  = '#0b939b'
g.terminal_color_7  = '#d3d7cf'
g.terminal_color_8  = '#555753'

-- g.terminal_color_9  = '#ef2929'
g.terminal_color_9  = '#FC4B33'

-- g.terminal_color_10 = '#8ae234'
g.terminal_color_10 = '#43EA3C'

g.terminal_color_11 = '#fce94f'

-- g.terminal_color_12 = '#729fcf'
-- g.terminal_color_12 = '#6749F0'
g.terminal_color_12 = '#D285B0'

-- g.terminal_color_13 = '#ad7fa8'
g.terminal_color_13 = '#E051DD'

g.terminal_color_14 = '#00f5e9'
g.terminal_color_15 = '#eeeeec'

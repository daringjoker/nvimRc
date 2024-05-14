function push(tbl, value)
  tbl[#tbl + 1] = value
end

local harpoonSection = {
  title = 'Harpoon',
  icon = '⥝',
  draw = function()
    local harpoon = require 'harpoon.mark'
    local bufCount = harpoon.get_length()
    local possibleBufNumber = { 'h', 'j', 'k', 'l' }
    local bufList = {}
    for i = 1, bufCount, 1 do
      local bufName = harpoon.get_marked_file(i).filename
      bufName = string.gsub(bufName, '.*/', '')
      local bufNr = possibleBufNumber[i] or i
      local currMark = '  '
      if i == harpoon.get_current_index() then
        currMark = '🪝'
      end

      local bufIcon = require('nvim-web-devicons').get_icon(bufName, string.match(bufName, '%a+$')) or '🗎'
      bufList[#bufList + 1] = currMark .. ' ' .. bufNr .. ' ' .. bufIcon .. '  ' .. bufName
    end
    return bufList
  end,
  bindings = {
    ['<cr>'] = function(line, col)
      require('harpoon.ui').nav_file(line + 1)
    end,
    ['e'] = function(line, col)
      require('fidget').notify(require('harpoon.mark').get_marked_file(line + 1).filename, 'warn')
    end,
    ['d'] = function(line, col)
      local harpoon = require 'harpoon'
      table.remove(harpoon.get_mark_config().marks, line + 1)
    end,
    ['D'] = function()
      require('harpoon.mark').clear_all()
    end,
    ['<M-j>'] = function(line, col)
      if line == require('harpoon.mark').get_length() - 1 then
        return
      end
      local harpoon = require 'harpoon'
      local temp = harpoon.get_mark_config().marks[line + 1]
      harpoon.get_mark_config().marks[line + 1] = harpoon.get_mark_config().marks[line + 2]
      harpoon.get_mark_config().marks[line + 2] = temp
      vim.cmd '+1'
    end,
    ['<M-k>'] = function(line, col)
      if line == 0 then
        return
      end
      local harpoon = require 'harpoon'
      local temp = harpoon.get_mark_config().marks[line + 1]
      harpoon.get_mark_config().marks[line + 1] = harpoon.get_mark_config().marks[line]
      harpoon.get_mark_config().marks[line] = temp
      vim.cmd '-1'
    end,
  },
}

return {
  'sidebar-nvim/sidebar.nvim',
  name = 'sidebar-nvim',
  priority = 999,
  config = function()
    local sidebar = require 'sidebar-nvim'
    sidebar.setup {
      initial_width = 30,
      section_title_separator = {},
      open = false, -- Closed by default
      side = 'right',
      sections = { harpoonSection, 'diagnostics', 'todos', 'buffers', 'git' },
      section_separator = '',
    }

    vim.keymap.set('n', '<leader>i', function()
      if vim.bo.filetype == 'SidebarNvim' then
        vim.cmd.wincmd 'p'
        sidebar.close()
      else
        sidebar.focus()
      end
      vim.cmd.wincmd '='
    end, { desc = 'Un/Focus Sidebar' })
  end,
}

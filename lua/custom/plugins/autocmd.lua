vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local uninportant_filetype = { 'neo-tree', 'SidebarNvim', 'fidget' }
    local unimp = {}
    for _, v in pairs(uninportant_filetype) do
      unimp[v] = true
    end
    local windows = vim.api.nvim_tabpage_list_wins(0)
    local current_win = vim.api.nvim_get_current_win()
    for _, v in pairs(windows) do
      if v ~= current_win then
        local ft = vim.bo[vim.api.nvim_win_get_buf(v)].filetype
        if ft ~= nil and unimp[ft] ~= true then
          return
        end
      end
    end
    local numTabs = vim.api.nvim_list_tabpages()
    if #numTabs == 1 then
      vim.cmd 'qa!'
    else
      vim.cmd 'tabclose'
    end
  end,
})

local closeBySize = function()
  local minWidthReq = {
    { name = 'sidebar', closeBelow = 180, closeCmd = 'SidebarNvimClose', openCmd = 'SidebarNvimOpen' },
    { name = 'Neotree', closeBelow = 120, closeCmd = 'Neotree close', openCmd = 'Neotree reveal' },
  }
  local width = vim.o.columns
  for _, v in pairs(minWidthReq) do
    if width < v.closeBelow then
      vim.cmd(v.closeCmd)
    else
      vim.cmd(v.openCmd)
    end
  end
end

-- vim.api.nvim_create_autocmd('VimResized', {
--   callback = closeBySize,
-- })

vim.api.nvim_create_autocmd('BufLeave', {
  callback = function()
    if vim.bo.filetype == 'SidebarNvim' then
      require('sidebar-nvim').close()
      vim.cmd.wincmd '='
    end
    -- if vim.bo.filetype == 'neo-tree' then
    --   vim.cmd.Neotree 'close'
    -- end
  end,
})
-- return empty table
return {}

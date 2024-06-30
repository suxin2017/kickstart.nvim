local Path = require 'plenary.path'
local function get_folder_node(state)
  local tree = state.tree
  local node = tree:get_node()
  local node_path = node:get_id()
  if node ~= nil then
    if node.type == 'directory' then
      return node_path
    else
      return node:get_parent_id()
    end
  end
end
local function paset_to_node(lines)
  if vim.bo.filetype == 'neo-tree' then
    -- 获取源码
    local manager = require 'neo-tree.sources.manager'
    local source = vim.api.nvim_buf_get_var(0, 'neo_tree_source')

    if source ~= 'filesystem' then
      return
    end

    -- get state
    local state = manager.get_state(source)
    if state == nil then
      return
    end

    local target_path = get_folder_node(state)

    -- 遍历复制的每一行
    for i, line in ipairs(lines) do
      if vim.startswith(line, '/') then
        if vim.uv.fs_stat(line) then
          local fileName
          local new_path
          if vim.fn.isdirectory(line) then
            if vim.endswith(line, '/') then
              line = line.sub(line, 1, -2)
            end
            fileName = string.sub(line, string.len(vim.fs.dirname(line)) + 2)
            new_path = vim.fs.joinpath(target_path, fileName)
          else
            fileName = vim.fs.basename(line)
            new_path = vim.fs.joinpath(target_path, fileName)
          end
          -- print('new_path=>' .. new_path)
          -- print('old_path=>' .. line)
          local source_path = Path.new(line)
          Path.copy(source_path, {
            destination = new_path,
            interactive = true,
            recursive = true,
          })
          return 1
        end
      end
    end
  end
end
vim.paste = (function(overridden)
  ---@param lines  string[] # |readfile()|-style list of lines to paste. |channel-lines|
  ---@param phase (-1|1|2|3)  -1: "non-streaming" paste: the call contains all lines.
  return function(lines, phase)
    if paset_to_node(lines) == nil then
      overridden(lines, phase)
    end
  end
end)(vim.paste)

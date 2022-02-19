local docgen = require('docgen')

local docs = {}

docs.test = function()
  -- TODO: Fix the other files so that we can add them here.
  local input_files = {
    './lua/orgmode/api/init.lua',
    './lua/orgmode/api/file.lua',
    './lua/orgmode/api/headline.lua',
    './lua/orgmode/api/position.lua',
  }

  local output_file = './doc/orgmode_api.txt'
  local output_file_handle = io.open(output_file, 'w')
  output_file_handle:write('orgmode_api.txt                     *orgmode_api* *orgmode api*\n\n')
  output_file_handle:write('* NOTE: This file is autogenerated from code annotations\n\n')

  for _, input_file in ipairs(input_files) do
    docgen.write(input_file, output_file_handle)
  end

  output_file_handle:write(' vim:tw=78:ts=8:ft=help:norl:\n')
  output_file_handle:close()
  vim.cmd([[checktime]])
end

docs.test()

return docs
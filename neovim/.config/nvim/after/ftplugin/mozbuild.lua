vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = 'moz.build',
  callback = function(args)
    local filepath = args.file

    vim.fn.jobstart({ './mach', 'lint', filepath, '--fix' }, {
      cwd = vim.fn.getcwd(),
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data and #data > 0 then
          print(table.concat(data, '\n'))
        end
      end,
    })
  end,
})

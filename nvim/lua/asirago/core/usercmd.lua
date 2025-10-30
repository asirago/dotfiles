vim.api.nvim_create_user_command("DeleteCurrentBuffer", function()
    local current_buffer_number = vim.fn.bufnr("%")
    local buffer_list = vim.fn.getbufinfo({ buflisted = 1 })
    local buffer_number = #buffer_list
    if buffer_number <= 1 then
        vim.cmd("bdelete")
    elseif current_buffer_number == buffer_list[buffer_number].bufnr then
        vim.cmd("bprevious|bdelete #")
    else
        vim.cmd("bnext|bdelete #")
    end
end, {
    desc = "delete current buffer",
})

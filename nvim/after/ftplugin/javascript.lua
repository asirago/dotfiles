local ft = vim.bo.filetype

if ft == "javascript" or ft == "javascriptreact" then
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
end

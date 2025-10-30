local ft = vim.bo.filetype

if ft == "typescript" or ft == "typescriptreact" then
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
end

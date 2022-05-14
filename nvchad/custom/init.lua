require "custom.mappings"


-- replace close_buffer function (leader + x)
nvchad.close_buffer = function(force)
    if vim.bo.buftype == "terminal" then
       vim.api.nvim_win_hide(0)
       return
    end

    force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"
    local close_cmd = force and ":bd!" or ":bd"
    vim.cmd(close_cmd)
 end
-- luacheck: ignore 112 113
---@diagnostic disable: undefined-global
if vim.g.started_by_firenvim == nil then
    return
end
vim.g.firenvim_config = {
    localSettings = {
        ['.*'] = {
            cmdline = 'firenvim',
            priority = 0,
        },
        ['https://(poe|(www\\.google|.*\\.zhihu))\\.com'] = {
            takeover = 'never',
            priority = 1,
        },
    }
}
vim.keymap.set('i', '<S-lt>', '<')
vim.keymap.set('n', '<C-Z>', vim.fn['firenvim#hide_frame'])
vim.keymap.set('i', '<C-Z>', vim.fn['firenvim#hide_frame'])
vim.keymap.set('n', '<C-.>', vim.fn['firenvim#focus_page'])
vim.keymap.set('i', '<C-.>', vim.fn['firenvim#focus_page'])
local augroup_id = vim.api.nvim_create_augroup('init#firenvim', {})
vim.api.nvim_create_autocmd('UIEnter', {
    group = augroup_id,
    callback = function()
        vim.o.laststatus = 0
        vim.o.showtabline = 0
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = 'www.bitahub.com_project-run_*.txt',
    callback = function()
        vim.bo.filetype = 'sh'
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = 'forums.gentoo.org_*.txt,{bbs.archlinux.org,forums.gentoo.org}_*.txt',
    callback = function()
        vim.bo.filetype = 'bbcode'
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = '{{forum,*-forum,community,devforum,talk,discuss,discourse,gitlab}.*,\
*.stackexchange.com,aur.archlinux.org,github.com,www.{cnblogs,jianshu}.com}_*.txt',
    callback = function()
        vim.bo.filetype = 'pandoc'
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = 'jqplay.org_jq_*.txt',
    callback = function()
        vim.bo.filetype = 'jq'
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = 'colab.research.google.com_*.txt',
    callback = function()
        vim.bo.filetype = 'python'
    end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup_id,
    pattern = 'mail.*.txt',
    callback = function()
        vim.bo.filetype = 'mail'
    end
})

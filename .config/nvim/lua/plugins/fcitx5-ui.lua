local fcitx5 = require "fcitx5-ui"
local consts = require "fcitx5-ui.consts"
fcitx5.setup({
  keys = {
    trigger = {
      '<C-\\>', consts.FcitxKey.space, consts.FcitxKeyState.super,
    },
    c_2 = {
      '<C-Space>', 0x32, consts.FcitxKeyState.ctrl,
    },
  }
})

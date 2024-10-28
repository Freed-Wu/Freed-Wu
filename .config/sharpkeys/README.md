# sharpkeys

<!-- markdownlint-disable MD033 -->

- map <kbd>CapsLock</kbd> to <kbd>Ctrl_R</kbd>
- map <kbd>Alt_R</kbd> to <kbd>Esc</kbd>

<!-- markdownlint-enable MD033 -->

## Windows

- [sharpkeys](https://github.com/randyrants/sharpkeys)
- [dual-key-remap](https://github.com/ililim/dual-key-remap)
- [xkeymacs](https://github.com/fujieda/xkeymacs)

## Linux/X11

```sh
sudo ln -sf ~/.local/share/gentoo/usr/share/X11/xkb/symbols/{pc,altwin} /usr/share/X11/xkb/symbols
```

## Linux/console

```sh
sudo ln -s \
~/.local/share/gentoo/usr/share/keymaps/i386/qwerty/us-custom.map.gz /usr/share/keymaps/i386/qwerty
echo KEYMAP=us-custom | sudo tee /etc/vconsole.conf
```

## Android

- [APP](https://github.com/Freed-Wu/Freed-Wu/releases/download/0.0.1/ExKeyMo.Keyboard.Layout.apk)
  built by [exkeymo-web](https://github.com/ris58h/exkeymo-web).

For Android tablet bluetooth keyboard, it swaps:

<!-- markdownlint-disable MD033 -->

- <kbd>capslock</kbd> and <kbd>ctrl</kbd>
- <kbd>cmd</kbd> and <kbd>alt</kbd>
- <kbd>esc</kbd> and <kbd>home</kbd>
- <kbd>power</kbd> and <kbd>delete</kbd>

<!-- markdownlint-enable MD033 -->

```sh
# uninstall old
adb uninstall ris58h.exkeymo_keyboard_layout
adb install ExKeyMo.Keyboard.Layout.apk
```

`res/Q2.kcm`:

```kcm
type OVERLAY

# Modifications made by ExKeyMo project:
map key 111 POWER
map key 1 HOME
map key 56 META_LEFT
map key 58 CTRL_RIGHT
map key 125 ALT_LEFT
map key 116 FORWARD_DEL
map key 172 ESCAPE
map key 97 CAPS_LOCK
```

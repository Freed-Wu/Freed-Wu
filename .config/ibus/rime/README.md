# Install

## Ubuntu

```sh
sudo apt-get -y install rime-data-double-pinyin rime-data-emoji
sudo add-apt-repository ppa:freedwu/rime
sudo apt-get -y update
sudo apt-get -y install rime-data-kaomoji rime-data-japanese
```

## ArchLinux

```sh
sudo pacman -S rime-double-pinyin rime-emoji
paru -S rime-kaomoji rime-japanese
```

## NixOS

```nix
{ config, pkgs, lib, ... }:

let
  rimeDataPkgs = with pkgs; [
    rime-data
    nur.repos.Freed-Wu.rime-kaomoji
    nur.repos.Freed-Wu.rime-japanese
  ];
in
{
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    (fcitx5-rime.override { rimeDataPkgs = rimeDataPkgs; })
  ];
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [
    (rime.override { rimeDataPkgs = rimeDataPkgs; })
  ];
}
```

## Android

```sh
adb push ~/.config/ibus/rime /sdcard
adb push /usr/share/rime-data /sdcard
```

{ config, pkgs, ... }:
{
  home.username = "iyass";
  home.homeDirectory = "/home/iyass";
  home.stateVersion = "26.05";

  imports =[
    # ./modules/rofi
    # ./modules/swww
    # ./modules/waybar
    # ./modules/ags
    # ./modules/mako
    # ./modules/hypr/hyprlock
    # ./modules/hypr/hypridle
    # ./modules/swappy
    ./modules/git.nix
    ./modules/core.nix
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/configuration/hypr/hyprland.lua";
}

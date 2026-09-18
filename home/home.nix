{ config, pkgs, ... }:
{
  home.username = "iyass";
  home.homeDirectory = "/home/iyass";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

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

  fonts.fontconfig.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "lua";
    systemd.enable = false;
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    gtk3.extraConfig = {
      gtk-xft-dpi = 96000;
    };
    gtk4.extraConfig = {
      gtk-xft-dpi = 96000;
    };
  };

  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/configuration/hypr/hyprland.lua";
  xdg.configFile."kitty/kitty.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/configuration/kitty/kitty.conf";
  xdg.configFile."waybar/config.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/configuration/waybar/config.jsonc";
}

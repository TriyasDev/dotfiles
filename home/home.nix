{ config, pkgs, ... }:
{
  home.username = "iyass";
  home.homeDirectory = "/home/iyass";
  home.stateVersion = "26.05";

  imports = [
    ./hyprland.nix
  ];

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    rofi
    thunar
    vscodium
    kitty
    hyprpaper
    wl-clipboard
    font-awesome
    waybar
  ];

  programs.git = {
    enable = true;
    settings.user.name = "TiyasDev";
    settings.user.email = "iyastriyas2@gmail.com";
#      userName = "TiyasDev";
#      userEmail = "iyastriyas2@gmail.com";
  };
}

{ pkgs, ... }:

{
  home.username = "iyass";
  home.homeDirectory = "/home/iyass";

  # Pindahkan paket-paket khusus level user ke sini
  home.packages = with pkgs; [
    # GUI Tools
    rofi
    thunar
    vscodium
    mpv
    amberol
    networkmanagerapplet

    # Hyprland Tools
    hyprpicker
    hyprlock
    hypridle
    hyprpaper
    waybar
    mako

    # Media / Utilities
    grim
    slurp
    swappy
    wl-clipboard
    cliphist
    brightnessctl
    pavucontrol
    bibata-cursors
    tree
  ];

  # Konfigurasi program spesifik via Home Manager
  programs.kitty = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Nama GitHub Kamu";
    userEmail = "email@kamu.com";
  };

  # Environment variables khusus user
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
  };

  # Versi state Home Manager
  home.stateVersion = "26.05";

  # Biarkan Home Manager mengelola dirinya sendiri
  programs.home-manager.enable = true;
}
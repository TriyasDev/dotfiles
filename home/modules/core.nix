{ pkgs, ...}:
{
  home.packages = with pkgs; [
    rofi
    kitty
    hyprpaper
    waybar
    wl-clipboard
    pamixer
    pavucontrol
    playerctl
    polkit-kde-agent
    mako
    libnotify
    nerd-fonts.jetbrains-mono

    godot
    android-studio
    thunar
    vscodium
  ]; 
}
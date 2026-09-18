{ pkgs, ...}:
{
  home.packages = with pkgs; [
    brightnessctl
    rofi
    kitty
    hyprpaper
    waybar
    wl-clipboard
    pamixer
    pavucontrol
    playerctl
    kdePackages.polkit-kde-agent-1
    mako
    libnotify
    nerd-fonts.jetbrains-mono

    steam
    godot
    android-studio
    thunar
    vscodium
  ]; 
}
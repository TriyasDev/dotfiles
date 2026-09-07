{ pkgs, ...}:
{
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
}
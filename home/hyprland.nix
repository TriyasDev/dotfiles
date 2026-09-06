{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "hyprlang";
    systemd.enable = false;
    settings = {
      monitor = [
        ",preferred,auto,1"
      ];
      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, Q, killactive,"
        "SUPER, M, exit,"
        "SUPER, E, exec, thunar"
        "SUPER, V, togglefloating,"
        "SUPER, R, exec, rofi -show drun"
      ];
      "exec-once" = [
        "waybar"
      ];
    };
  };
}

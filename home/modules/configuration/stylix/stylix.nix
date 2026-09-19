{ pkgs, ... }:
{
  stylix.image = /home/iyass/Gallery/wallpaper/gray2.jpeg;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.polarity = "dark";

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    sizes = {
      applications = 10;
      terminal = 11;
      desktop = 10;
    };
  };

  stylix.targets.hyprland.enable = false;
  stylix.targets.regreet.enable = false;
}
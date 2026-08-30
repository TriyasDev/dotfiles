{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader & Hardware
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.enableRedistributableFirmware = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Networking & Locale
  networking.hostName = "nixos-01";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";
  services.xserver.xkb.layout = "us";
  services.libinput.enable = true;
  services.gvfs.enable = true;
  services.dbus.enable = true;
  services.udisks2.enable = true;

  # Power Management
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  powerManagement.powertop.enable = true;

  # Hyprland & Display Manager
  programs.hyprland.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = "greeter";
      };
    };
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {	
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };

  # System-wide Apps
  programs.nano.nanorc = ''
    set nowrap
    set tabstospaces
    set tabsize 4
    set linenumbers
  '';
  programs.steam.enable = true;
  programs.firefox.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # User Account Definition
  users.users.iyass = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # System-wide Packages (Paket core/CLI dasar saja)
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  # Audio & Security
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Graphics & System Environment Variables
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER_NAME = "radeonsi";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland,x11,*";
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
  ];

  # Nix Settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  system.stateVersion = "26.05";
}

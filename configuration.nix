{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  time.hardwareClockInLocalTime = true;
  time.timeZone = "Europe/Rome";

  services.getty.autologinUser = "jeco";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.jeco = {
    isNormalUser = true;
    extraGroups = [ "wheel" "openrazer" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  }; 
  
  #shutdown stuff
  services.logind.settings.Login.KillUserProcesses = true;
  boot.blacklistedKernelModules = [ "nvidia_wmi_ec_backlight" ];  

  #mouse
  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    kitty
    waybar
    git
    hyprpaper
    foot
    razergenie 
    kdePackages.dolphin
    pulseaudio
    pavucontrol
  ];

  #sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; # Did you read the comment?
}


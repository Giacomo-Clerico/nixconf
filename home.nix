{ config, pkgs, ...}:
{
  home.username = "jeco";
  home.homeDirectory = "/home/jeco";
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      c = "clear";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec start-hyprland
      fi
    '';
  };
  
  home.packages = with pkgs; [
    bat
    nwg-look  
    btop

  ];
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/foot".source = ./config/foot;
} 

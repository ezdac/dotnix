{ pkgs, ... }:
{
  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
    fira-code-symbols
  ];

  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+k" = "next_tab";
      "ctrl+shift+j" = "previous_tab";
    };
    settings = {
      font_size = "14.0";
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      tab_bar_style = "separator";
    };
    theme = "Spacedust";
  };
}

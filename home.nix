{ lib, config, pkgs, caelestia-shell, ... }:

with lib.hm.gvariant;

{
  home.username = "gleb";
  home.homeDirectory = "/home/gleb";
  home.stateVersion = "25.11";

  {
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
#   settings = {
#     bar.status = {
#       showBattery = false;
#     };
#      paths.wallpaperDir = "~/Images";
#    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
      theme.enableGtk = false;
      };
    };
  };


  dconf.settings = {
    "net/launchpad/plank/docks/dock1" = {
      alignment = "fill";
      current-workspace-only = true;
      dock-items = [ "firefox.dockitem" ];
      hide-mode = "intelligent";
      icon-size = 50;
      lock-items = false;
      pinned-only = false;
      pressure-reveal = true;
      theme = "Transparent";
    };

    "org/cinnamon" = {
      alttab-switcher-delay = 100;
      enabled-applets = [ "panel1:left:0:menu@cinnamon.org:0" "panel1:left:2:separator@cinnamon.org:1" "panel1:right:5:systray@cinnamon.org:3" "panel1:right:6:xapp-status@cinnamon.org:4" "panel1:right:7:notifications@cinnamon.org:5" "panel1:right:8:printers@cinnamon.org:6" "panel1:right:9:removable-drives@cinnamon.org:7" "panel1:right:10:keyboard@cinnamon.org:8" "panel1:right:12:network@cinnamon.org:10" "panel1:right:14:power@cinnamon.org:12" "panel1:center:0:calendar@cinnamon.org:13" "panel1:right:16:cornerbar@cinnamon.org:14" "panel1:left:1:workspace-switcher@cinnamon.org:16" "panel1:right:2:sound150@claudiux:18" "panel1:right:1:weather@mockturtl:19" "panel1:left:4:temperature@fevimu:20" ];
      next-applet-id = 21;
      panel-edit-mode = false;
      panel-zone-symbolic-icon-sizes = "[{\"panelId\": 1, \"left\": 28, \"center\": 28, \"right\": 16}]";
      panels-enabled = [ "1:0:left" ];
      panels-height = [ "1:50" ];
    };

    "org/cinnamon/desktop/a11y/applications" = {
      screen-keyboard-enabled = false;
      screen-reader-enabled = false;
    };

    "org/cinnamon/desktop/a11y/mouse" = {
      dwell-click-enabled = false;
      dwell-threshold = 10;
      dwell-time = 1.2;
      secondary-click-enabled = false;
      secondary-click-time = 1.2;
    };

    "org/cinnamon/desktop/applications/calculator" = {
      exec = "gnome-calculator";
    };

    "org/cinnamon/desktop/applications/terminal" = {
      exec = "alacritty";
      exec-arg = "--fish";
    };

    "org/cinnamon/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
    };

    "org/cinnamon/desktop/interface" = {
      cursor-blink-time = 1200;
      toolkit-accessibility = false;
    };

    "org/cinnamon/desktop/keybindings" = {
      custom-list = [ "custom0" "custom1" "__dummy__" ];
    };

    "org/cinnamon/desktop/keybindings/custom-keybindings/custom0" = {
      binding = [ "<Super>q" ];
      command = "alacritty";
      name = "alacritty";
    };

    "org/cinnamon/desktop/keybindings/custom-keybindings/custom1" = {
      binding = [];
      command = "dolphin";
      name = "dolphin";
    };

    "org/cinnamon/desktop/keybindings/wm" = {
      move-to-workspace-1 = [ "<Shift><Super>exclam" ];
      move-to-workspace-2 = [ "<Shift><Super>at" ];
      move-to-workspace-3 = [ "<Shift><Super>numbersign" ];
      move-to-workspace-4 = [ "<Shift><Super>dollar" ];
      switch-input-source = [ "<Alt>Shift_L" "<Shift>Alt_L" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      toggle-fullscreen = [ "<Super>f" ];
    };

    "org/cinnamon/desktop/media-handling" = {
      autorun-never = false;
    };

    "org/cinnamon/desktop/peripherals/keyboard" = {
      delay = mkUint32 500;
      repeat-interval = mkUint32 30;
    };

    "org/cinnamon/desktop/screensaver" = {
      layout-group = 0;
    };

    "org/cinnamon/desktop/sound" = {
      allow-amplified-volume = true;
      event-sounds = false;
    };

    "org/cinnamon/desktop/wm/preferences" = {
      focus-mode = "mouse";
      min-window-opacity = 30;
    };

    "org/cinnamon/gestures" = {
      swipe-down-2 = "PUSH_TILE_DOWN::end";
      swipe-down-3 = "TOGGLE_OVERVIEW::end";
      swipe-down-4 = "VOLUME_DOWN::end";
      swipe-left-2 = "PUSH_TILE_LEFT::end";
      swipe-left-3 = "WORKSPACE_NEXT::end";
      swipe-left-4 = "WINDOW_WORKSPACE_PREVIOUS::end";
      swipe-right-2 = "PUSH_TILE_RIGHT::end";
      swipe-right-3 = "WORKSPACE_PREVIOUS::end";
      swipe-right-4 = "WINDOW_WORKSPACE_NEXT::end";
      swipe-up-2 = "PUSH_TILE_UP::end";
      swipe-up-3 = "TOGGLE_EXPO::end";
      swipe-up-4 = "VOLUME_UP::end";
      tap-3 = "MEDIA_PLAY_PAUSE::end";
    };

    "org/cinnamon/muffin" = {
      draggable-border-width = 10;
    };

    "org/cinnamon/settings-daemon/plugins/color" = {
      night-light-last-coordinates = mkTuple [ 50.433333 30.516667 ];
    };

    "org/gnome/desktop/a11y" = {
      always-show-text-caret = false;
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-keyboard-enabled = false;
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/a11y/mouse" = {
      dwell-click-enabled = false;
      dwell-threshold = 10;
      dwell-time = 1.2;
      secondary-click-enabled = false;
      secondary-click-time = 1.2;
    };

    "org/gnome/desktop/input-sources" = {
      current = mkUint32 0;
      show-all-sources = false;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
      xkb-options = [ "grp:alt_shift_toggle" ];
    };

    "org/gnome/desktop/interface" = {
      can-change-accels = false;
      clock-show-date = false;
      clock-show-seconds = false;
      cursor-blink = true;
      cursor-blink-time = 1200;
      cursor-blink-timeout = 10;
      cursor-size = 24;
      cursor-theme = "Bibata-Modern-Classic";
      enable-animations = true;
      font-name = "Ubuntu 10";
      gtk-color-palette = "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90";
      gtk-color-scheme = "";
      gtk-enable-primary-paste = true;
      gtk-im-module = "";
      gtk-im-preedit-style = "callback";
      gtk-im-status-style = "callback";
      gtk-key-theme = "Default";
      gtk-theme = "Mint-Y-Aqua";
      gtk-timeout-initial = 200;
      gtk-timeout-repeat = 20;
      icon-theme = "Mint-Y-Sand";
      menubar-accel = "F10";
      menubar-detachable = false;
      menus-have-tearoff = false;
      scaling-factor = mkUint32 0;
      text-scaling-factor = 1.0;
      toolbar-detachable = false;
      toolbar-icons-size = "large";
      toolbar-style = "both-horiz";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "default";
      double-click = 400;
      drag-threshold = 8;
      left-handed = false;
      middle-click-emulation = false;
      natural-scroll = false;
      speed = 0.0;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = false;
      disable-microphone = false;
      disable-sound-output = false;
      old-files-age = mkUint32 30;
      recent-files-max-age = 7;
      remember-recent-files = true;
      remove-old-temp-files = false;
      remove-old-trash-files = false;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
      input-feedback-sounds = false;
      theme-name = "LinuxMint";
    };

    "org/gnome/desktop/wm/preferences" = {
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "lower";
      action-right-click-titlebar = "menu";
      audible-bell = false;
      auto-raise = false;
      auto-raise-delay = 500;
      button-layout = ":minimize,maximize,close";
      disable-workarounds = false;
      focus-mode = "mouse";
      focus-new-windows = "smart";
      mouse-button-modifier = "<Alt>";
      num-workspaces = 4;
      raise-on-click = true;
      resize-with-right-button = true;
      theme = "Mint-Y";
      titlebar-font = "Ubuntu Medium 10";
      titlebar-uses-system-font = false;
      visual-bell = false;
      visual-bell-type = "fullscreen-flash";
      workspace-names = [];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 148;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 0 0 ];
      window-size = mkTuple [ 908 466 ];
    };

    "org/nemo/preferences" = {
      show-hidden-files = true;
    };

    "org/nemo/search" = {
      search-file-case-sensitive = false;
      search-files-use-regex = false;
      search-reverse-sort = false;
      search-sort-column = "name";
    };

    "org/nemo/window-state" = {
      geometry = "800x550+140+90";
      maximized = false;
      sidebar-bookmark-breakpoint = 0;
      start-with-sidebar = true;
    };

    "org/x/apps/favorites" = {
      list = [ "file:///etc/nixos::inode/directory" ];
    };

    "org/x/editor/plugins" = {
      active-plugins = [ "docinfo" "modelines" "joinlines" "spell" "time" "filebrowser" "sort" "textsize" "bracketcompletion" "open-uri-context-menu" ];
    };

    "org/x/editor/plugins/filebrowser/on-load" = {
      root = "file:///";
      tree-view = true;
      virtual-root = "file:///etc/nixos";
    };

    "org/x/editor/preferences/ui" = {
      statusbar-visible = true;
    };

    "org/x/editor/state/history-entry" = {
      history-search-for = [ "environment" ];
    };

    "org/x/editor/state/window" = {
      bottom-panel-size = 140;
      side-panel-active-page = 827629879;
      side-panel-size = 200;
      size = mkTuple [ 650 500 ];
      state = 43908;
    };

    "org/x/warpinator/preferences" = {
      ask-for-send-permission = true;
      autostart = false;
      connect-id = "NIXOS-6AAEB6522DAE001F8ACA";
      no-overwrite = true;
    };

  };
}

{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ];
  dconf.settings = {
    # "org/gnome/desktop/background" = {
    #   picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    # };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita Dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Wayland, X, etc. support for session vars
  systemd.user.sessionVariables = config.home-manager.users.mohamed.home.sessionVariables;

  xdg = {
    enable = true;
    dataHome = "${config.home.homeDirectory}/.local/share";
    mime.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Mohamed Hisham Abdelzaher";
      userEmail = "mohamed.hisham.abdelzaher@gmail.com";
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
        batpipe
        prettybat
      ];
    };
    btop.enable = true;
    command-not-found.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
    };
    gh.enable = true;
    jq.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
    ruff = {
      enable = true;
      settings = {
        line-length = 100;
        per-file-ignores = {
          "__init__.py" = [ "F401" ];
        };
        lint = {
          select = [
            "E4"
            "E7"
            "E9"
            "F"
          ];
          ignore = [ ];
        };
      };
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "[┌───────────────────<](bold green) @ $all $line_break"
          "[└─](bold green)$character"
        ];
        character = {
          success_symbol = "➜";
          error_symbol = "➜";
        };
      };
    };
    topgrade = {
      enable = true;
      settings = {
        misc = {
          assume_yes = true;
          disable = [
            "pixi"
            "uv"
          ];
          set_title = false;
          cleanup = true;
        };
        commands = {
          "Run garbage collection on Nix store" = "nix-collect-garbage";
        };
      };
    };
    yt-dlp = {
      enable = true;
    };
    aria2 = {
      enable = true;
    };
    vscode = {
      enable = true;
    };
    ssh = {
      enable = true;
    };
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };

  home = {
    packages = with pkgs; [
      google-chrome
      ffmpeg
      code-cursor
      clapper
      nodejs_22
      pixi
      vlc
      celeste
      distrobox
      autoflake
      fastlane
      act
      flutterPackages.stable
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      audacity
      spacedrive
      zed-editor
      gearlever
      discord
      httpie
      httpie-desktop
      podman-compose
      podman-desktop
      termius
      remmina
      kubectl
      kubernetes
      kompose
      warp-terminal
      kdePackages.kget
      nextcloud-client
      gnome-boxes
      shotwell
      gnome-contacts
      bitwarden-cli
      bitwarden-desktop
      # gitbutler
    ];
    sessionPath = [
      "${config.home.homeDirectory}/.pixi/envs/default/bin"
      "${config.home.homeDirectory}/Android/Sdk/cmdline-tools/latest/bin"
    ];
    sessionVariables = {
      ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
      # GSK_RENDERER = "ngl";
      CONDA_PREFIX = "${config.home.homeDirectory}/.pixi/envs/default";
      PIXI_IN_SHELL = "1";
      PIXI_PROJECT_NAME = "default";
      PIXI_PROJECT_ROOT = "${config.home.homeDirectory}";
      PIXI_PROJECT_MANIFEST = "${config.home.homeDirectory}/pixi.toml";
      CONDA_DEFAULT_ENV = "default";
      PIXI_ENVIRONMENT_NAME = "default";
      PIXI_ENVIRONMENT_PLATFORMS = "linux-64";
      PIXI_PROMPT = "(default) ";
    };
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "mohamed";
    homeDirectory = "/home/mohamed";
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };
}

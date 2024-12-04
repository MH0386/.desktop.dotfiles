{
  config,
  lib,
  pkgs,
  inputs,
  system,
  fh,
  pkgsStable,
  ...
}:
{
  nix.settings = {
    substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://nix-community.cachix.org"
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
    trusted-users = [
      "root"
      "mohamed"
    ];
    experimental-features = [
      "flakes"
      "nix-command"
    ];
  };
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot = {
    # intel and nouveau are blacklisted
    blacklistedKernelModules = [
      "nouveau"
      # "nvidia_drm"
      # "nvidia_modeset"
      # "nvidia"
    ];
    kernelParams = [
      "apparmor=1"
      "security=apparmor"
    ];
    kernelModules = [ "apparmor" ];
    # extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxKernel.packages.linux_6_11;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mohamed = import ./home.nix;
    extraSpecialArgs = { };
    backupFileExtension = "Old";
  };

  networking = {
    # Define your hostname.
    hostName = "MohamedNixOS";
    # Enable networking
    networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  i18n = {
    extraLocaleSettings = {
      LANGUAGE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_COLLATE = "en_US.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    # Select internationalisation properties.
    defaultLocale = "en_US.UTF-8";
  };

  security.apparmor = {
    enable = true;
    policies.dummy.profile = ''
      /dummy {
      }
    '';
  };
  services = {
    avahi = {
      enable = true;
      publish.enable = true;
    };
    # snap.enable = true;
    flatpak = {
      enable = true;
      #remotes = lib.mkOptionDefault [
      #   {
      # name = "flathub";
      #  location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      # }
      #];
      uninstallUnmanaged = true;
      update.onActivation = true;
      packages = [
        "io.github._0xzer0x.qurancompanion"
        "io.github.ladaapp.lada"
        "io.github.giantpinkrobots.flatsweep"
        "io.github.lo2dev.Echo"
        "io.github.flattool.Warehouse"
        "app.fotema.Fotema"
        "io.github.giantpinkrobots.varia"
        "io.podman_desktop.PodmanDesktop"
        "com.github.marhkb.Pods"
        "io.github.sigmasd.stimulator"
        "im.fluffychat.Fluffychat"
        # "com.jeffser.Alpaca"
        "dev.skynomads.Seabird"
        "net.sapples.LiveCaptions"
        "org.nickvision.tubeconverter"
        "re.sonny.OhMySVG"
        "com.usebottles.bottles"
        "com.github.gijsgoudzwaard.image-optimizer"
        "fr.handbrake.ghb"
        "io.github.seadve.Kooha"
        "net.nokyan.Resources"
        "org.onlyoffice.desktopeditors"
        "com.github.unrud.djpdf"
        "com.github.unrud.RemoteTouchpad"
        "io.github.arunsivaramanneo.GPUViewer"
        "io.gitlab.news_flash.NewsFlash"
        "app.drey.Dialect"
        "com.warlordsoftwares.tube2go"
        "com.warlordsoftwares.formatlab"
        "io.github.zaedus.spider"
        "eu.nokun.MirrorHall"
        "es.danirod.Cartero"
        "pl.youkai.nscan"
        "com.mardojai.ForgeSparks"
        "com.gitbutler.gitbutler"
        "io.github.dvlv.boxbuddyrs"
        "com.github.tchx84.Flatseal"
        "com.quexten.Goldwarden"
        "com.belmoussaoui.snowglobe"
        "com.jetpackduba.Gitnuro"
        "de.philippun1.turtle"
        "de.philippun1.Snoop"
        "com.github.qarmin.szyszka"
        "com.github.qarmin.czkawka"
        "io.gitlab.theevilskeleton.Upscaler"
        "io.gitlab.adhami3310.Converter"
        "io.gitlab.adhami3310.Footage"
        "com.github.ADBeveridge.Raider"
        "com.github.tenderowl.frog"
        "org.angryip.ipscan"
        "org.gabmus.whatip"
        "org.nmap.Zenmap"
        "io.github.bytezz.IPLookup"
        "dev.geopjr.Archives"
        "io.bassi.Amberol"
        "io.github.getnf.embellish"
        "com.github.cassidyjames.dippi"
        "it.mijorus.whisper"
        "io.github.zen_browser.zen"
        # "com.github.joseexposito.touche"
        "com.ranfdev.Geopard"
        # "it.mijorus.gearlever"
        "io.github.vikdevelop.SaveDesktop"
        "org.fedoraproject.MediaWriter"
        "io.github.realmazharhussain.GdmSettings"
        "com.mattjakeman.ExtensionManager"
      ];
    };
    fwupd.enable = true;
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
    # Enable the KDE Plasma Desktop Environment.
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #    wayland.enable = true;
    #  };
    # };
    # desktopManager.plasma6.enable = true;
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      xkb.layout = "us";
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = [ "nvidia" ];
      # Enable the GNOME Desktop Environment.
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
      drivers = [
        pkgs.stablePackages.hplipWithPlugin
      ];
    };
    gnome.sushi.enable = true;
  };

  # qt.enable = true;

  hardware.enableAllFirmware = true;
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mohamed = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Mohamed Hisham";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "render"
      "adbusers"
      "libvirtd"
    ];
  };

  nixpkgs = {
    # Allow unfree packages
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [ (self: super: { stablePackages = pkgsStable; }) ];
  };

  programs = {
    zsh.enable = true;
    # evolution.enable = true;
    # firefox.enable = true;
    nix-ld.enable = true;
    # Hyperland
    # hyprland = {
    #   enable = true;
    #   xwayland.enable = true;
    # };
    virt-manager.enable = true;
    # thunderbird.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
      plugins = with pkgs; [
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-backgroundremoval
      ];
    };
    localsend.enable = true;
    appimage.enable = true;
    # for performance mode
    gamemode.enable = true;
    steam = {
      enable = true; # install steam
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    # coolercontrol.enable = true;
    nh = {
      enable = true;
      flake = "/home/mohamed/.dotfiles";
      /*
        clean = {
          enable = true;
          extraArgs = "--keep 5";
        };
      */
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ptyxis";
    };
  };

  fonts.packages = with pkgs; [ monaspace ];
  console.packages = with pkgs; [ monaspace ];

  environment = {
    sessionVariables = {
      NAUTILUS_4_EXTENSION_DIR = lib.mkDefault "${pkgs.stablePackages.nautilus-python}/lib/nautilus/extensions-4";
    };
    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
      "/share/nautilus-python/extensions"
    ];
    localBinInPath = true;
    homeBinInPath = true;
    systemPackages =
      (with pkgs; [
        wget
        nixfmt-rfc-style
        nixpkgs-fmt
        nixd
        gcc
        libgcc
        gnumake
        libtool
        #dbus
        packagekit
        lshw-gui
        lshw
        libsForQt5.full
        nvtopPackages.nvidia
        gnome-extensions-cli
        gnome-tweaks
        ntfs3g
        qemu_kvm
        qemu_full
        ddcui
        ddcutil
        devenv
        nautilus
        nautilus-python
      ])
      ++ (with pkgs.stablePackages; [
        cups
        xsane
        cups-filters
        ghostscript
        sane-backends
        sane-frontends
        python3Packages.notify2
        dbus
        python3Packages.reportlab
        libjpeg
        # libusb
        python311Packages.pygobject3
        python311Packages.pydbus
        # gnome-extension-manager
      ])
      ++ (with pkgs.stablePackages.gst_all_1; [
        gstreamer
        gst-plugins-base
        gst-plugins-good
        gst-plugins-bad
        gst-plugins-ugly
        gst-libav
      ])
      ++ [
        # fh.packages.${system}.default
        # inputs.zen-browser.packages.${system}.specific
        # inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
        # inputs.nix-software-center.packages.${system}.nix-software-center
        # pkgs.linuxPackages.nvidia_x11
        # cudaPackages.cudatoolkit
        # cudaPackages.nccl
        # cudaPackages.cudnn
        # cudaPackages.cuda_nvcc
      ];
  };

  # Enable common container config files in /etc/containers
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.package = pkgs.qemu_kvm;
    };
    containers.enable = true;
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
      extraPackages = with pkgs; [
        gvisor
        gvproxy
      ];
    };
  };

  hardware = {
    sane = {
      enable = true; # Enable SANE scanning support.
      extraBackends = [
        pkgs.stablePackages.hplipWithPlugin
      ];
      openFirewall = true;
      backends-package = pkgs.stablePackages.sane-backends;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
    nvidia-container-toolkit.enable = true;
    # Enable OpenGL , Nouveau
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-ocl
        intel-vaapi-driver
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };
    nvidia = {
      # Use the NVidia open source kernel module (not to be confused with the independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = true;
      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;
      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement = {
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
        # of just the bare essentials.
        enable = false;
        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        finegrained = false;
      };
      # Modesetting is required.
      modesetting.enable = true;
      /*
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      */
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    80
    443
    8000
    8001
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system = {
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      allowReboot = true;
      channel = "https://channels.nixos.org/nixos-24.05";
    };
  };
  # powerManagement.powertop.enable = true;
  #zramSwap.enable = true;
}

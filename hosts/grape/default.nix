{ ... }:

{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix
    ./home.nix
    ./mounts.nix
  ];

  modules = {
    theme.active = "dracula";
    desktop = {
      environments = {
        bspwm.enable = false;
        hyprland.enable = false;
        lxqt.enable = false;
        plasma.enable = true;
        xfce.enable = false;
      };
      backup.enable = false;
      clipboard.enable = false;
      documents.enable = true;
      fm.enable = true;
      fonts.enable = true;
      flatpak.enable = true;
      geany.enable = true;
      keepassxc.enable = false;
      kvantum.enable = false;
      mail.enable = true;
      plank.enable = false;
      screenshot.enable = false;
      mapping.enable = false;
      thonny.enable = true;
      vscodium.enable = true;
      apps = {
        anki.enable = true;
        blender.enable = false;
        calibre.enable = false;
        ghostwriter.enable = false;
        godot.enable = false;
        gpa.enable = false;
        gsmartcontrol.enable = true;
        nextcloud.enable = true;
        polish.enable = true;
        rofi.enable = true;
        torrent.enable = true;
      };
      browsers = {
        default = "firefox";
        chromium.enable = true;
        firefox.enable = true;
        lynx.enable = false;
        tor.enable = false;
      };
      communication = {
        delta.enable = true;
        discord.enable = true;
        jitsi.enable = true;
        matrix.enable = true;
        signal.enable = true;
        telegram.enable = true;
      };
      gaming = {
        retro.enable = false;
        steam.enable = false;
      };
      media = {
        audio.enable = true;
        daw.enable = false;
        graphics = {
          enable = true;
          raster.enable = true;
          vector.enable = true;
          photo.enable = false;
          sprites.enable = false;
        };
        kodi.enable = false;
        ncmpcpp.enable = false;
        video = {
          editing.enable = false;
          player.enable = true;
          recording.enable = false;
          transcoding.enable = false;
        };
      };
      term = {
        default = "kitty";
        st.enable = true;
        kitty.enable = true;
      };
      vm = {
        qemu.enable = false;
        virtualbox.enable = false;
        virt-manager.enable = false;
      };
    };
    dev = {
      cc.enable = false;
      clojure.enable = false;
      common-lisp.enable = false;
      db.enable = true;
      go.enable = false;
      java.enable = false;
      julia.enable = true;
      lua.enable = false;
      node.enable = false;
      python.enable = true;
      rust.enable = true;
      scala.enable = false;
    };
    editors = {
      default = "micro";
      helix.enable = true;
      micro.enable = true;
      vim.enable = true;
    };
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
      disks.enable = true;
      fancontrol.enable = false;
      image.enable = true;
      keebs.enable = true;
      mcus.enable = true;
      nvidia.enable = false;
      radeon.enable = false;
      printers.enable = true;
      sensors.enable = true;
      steamcon.enable = true;
      wacom.enable = true;
    };
    shell = {
      archive.enable = true;
      borg.enable = true;
      devops.enable = true;
      direnv.enable = true;
      git.enable = true;
      gnupg.enable = true;
      iperf.enable = true;
      lf.enable = true;
      aerc.enable = true;
      pass.enable = true;
      taskell.enable = false;
      zsh.enable = true;
      nu.enable = true;
      cli.enable = true;
    };
    services = {
      containerization.enable = true;
      containers = {
        snowflake.enable = false;
      };
      pods = {
        languagetool.enable = true;
        penpot.enable = false;
        scrutiny.enable = true;
        vaultwarden.enable = false;
      };
      gitea.enable = false;
      jellyfin.enable = false;
      k8s.enable = false;
      nginx.enable  = false;
      vpn.enable = true;
      ssh.enable = true;
      syncthing.enable = true;
      transmission.enable = false;
    };
  };

  # NixOS program modules
  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
    ssh.startAgent = true;
  };

  # NixOS service configuration
  services = {
    openssh.startWhenNeeded = true;
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Set Austrian as default layout
      # Optionally set more keymaps and use them with bin/keymapswitcher
      layout = "at, eu";
      # Enable touchpad support
      libinput.enable = true;
    };
  };

  # NixOS networking configuration
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  # Limit update size/frequency of rebuilds
  # See https://mastodon.online/@nomeata/109915786344697931
  documentation.nixos.enable = false;
}
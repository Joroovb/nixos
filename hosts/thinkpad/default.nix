{ ... }:

{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix
#    ./mounts.nix
    ./home.nix
  ];

  modules = {
    theme.active = "dracula";
    desktop = {
      environments = {
        bspwm.enable = true;
      };
      backup.enable = true;
      clipboard.enable = true;
      documents.enable = true;
      fm.enable = true;
      fonts.enable = true;
      mail.enable = true;
      mapping.enable = true;
      plank.enable = true;
      polish.enable = true;
      rofi.enable = true;
      screenshot.enable = true;
      torrent.enable = true;
      vscodium.enable = true;
      browsers = {
        default = "firefox";
        firefox.enable = true;
      };
      communication = {
        discord.enable = true;
        matrix.enable = true;
      };
      media = {
        audio.enable = true;
        ncmpcpp.enable = false;
      };
      term = {
        default = "kitty";
        st.enable = true;
        kitty.enable = true;
      };
    };
    dev = {
      cc.enable = false;
      go.enable = false;
      lua.enable = false;
      node.enable = false;
      python.enable = true;
      rust.enable = true;
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
      printers.enable = true;
      sensors.enable = true;
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
      ssh.enable = true;
      syncthing.enable = true;
      transmission.enable = false;
    };
  };

  # NixOS program modules
  programs = {
    # Needed for some home-manager settings
    dconf.enable = true;
    ssh.startAgent = true;
  };

  # NixOS service configuration
  services = {
    xserver = {
      layout = "us";
      displayManager = {
        autoLogin.enable = false;
        # Use GDM as display manager
        gdm.enable = true; 
	};
    };
  };

  # NixOS networking configuration
  networking = {
    networkmanager.enable = true;
    hostName = "thinkpad";
#    useDHCP = false;
  };
}

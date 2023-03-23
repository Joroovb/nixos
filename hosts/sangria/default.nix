{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    # ./home.nix
  ];

  modules = {
    theme.active = "dracula";
    desktop = {
      environments = {
        bspwm.enable = false;
        hyprland.enable = false;
        plasma.enable = false;
        lxqt.enable = false;
        xfce.enable = true;
      };
      backup.enable = false;
      clipboard.enable = false;
      documents.enable = false;
      fonts.enable = true;
      flatpak.enable = true;
      geany.enable = false;
      keepassxc.enable = false;
      kvantum.enable = false;
      mail.enable = true;
      plank.enable = false;
      screenshot.enable = false;
      fm.enable = true;
      mapping.enable = false;
      thonny.enable = false;
      vscodium.enable = false;
      apps = {
        anki.enable = false;
        blender.enable = false;
        calibre.enable = false;
        ghostwriter.enable = false;
        godot.enable = false;
        gpa.enable = false;
        gsmartcontrol.enable = false;
        nextcloud.enable = false;
        polish.enable = false;
        rofi.enable = false;
        torrent.enable = false;
      };
      browsers = {
        default = "firefox";
        chromium.enable = true;
        firefox.enable = true;
        lynx.enable = false;
        tor.enable = false;
      };
      communication = {
        delta.enable = false;
        discord.enable = false;
        jitsi.enable = false;
        matrix.enable = false;
        signal.enable = false;
        telegram.enable = false;
      };
      gaming = {
        retro.enable = false;
        steam.enable = false;
      };
      media = {
        audio.enable = true;
        daw.enable = false;
        graphics.enable = false;
        kodi.enable = true;
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
      db.enable = false;
      go.enable = false;
      java.enable = false;
      julia.enable = false;
      lua.enable = false;
      node.enable = false;
      python.enable = false;
      rust.enable = false;
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
      disks.enable = false;
      fancontrol.enable = false;
      image.enable = false;
      keebs.enable = false;
      mcus.enable = false;
      nvidia.enable = false;
      radeon.enable = false;
      printers.enable = true;
      sensors.enable = true;
      steamcon.enable = true;
      wacom.enable = false;
    };
    shell = {
      archive.enable = true;
      borg.enable = true;
      devops.enable = false;
      direnv.enable = false;
      git.enable = true;
      gnupg.enable = true;
      iperf.enable = true;
      lf.enable = true;
      aerc.enable = false;
      pass.enable = false;
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
        languagetool.enable = false;
        penpot.enable = false;
        scrutiny.enable = true;
        vaultwarden.enable = false;
      };
      gitea.enable = false;
      jellyfin.enable = true;
      kdeconnect.enable = true;
      k8s.enable = false;
      nginx.enable  = false;
      vpn.enable = false;
      ssh.enable = true;
      syncthing.enable = true;
      transmission.enable = false;
    };
  };

  programs.dconf.enable = true;
}

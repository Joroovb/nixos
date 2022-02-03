{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.containers;
in {
  options.modules.services.containers = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      docker
      docker-compose
      podman
      podman-compose
      lazydocker          # terminal UI for docker and docker-compose
      ctop                # container activity monitor
    ];

    env.DOCKER_CONFIG = "$XDG_CONFIG_HOME/docker";
    env.MACHINE_STORAGE_PATH = "$XDG_DATA_HOME/docker/machine";

    user.extraGroups = [ "docker" ];

    modules.shell.zsh.rcFiles = [ "${configDir}/docker/aliases.zsh" ];

    virtualisation = {
      docker = {
        enable = true;
        autoPrune.enable = true;
        enableOnBoot = false;
        # listenOptions = [];
      };
      podman = {
        enable = true;
        # Create a `docker` alias for podman, to use it as a drop-in replacement
        # dockerCompat = true;
      };
    };
  };
}
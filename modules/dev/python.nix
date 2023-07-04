# modules/dev/python.nix

{ config, options, lib, pkgs, my, ... }:

with lib;
with lib.my;
let cfg = config.modules.dev.python;
in {
  options.modules.dev.python = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      python310
      python310Packages.pip
      # pip update helpers
      python310Packages.pipdate
      python310Packages.virtualenv
      python310Packages.pytest-virtualenv
      python310Packages.virtualenv-clone
      python310Packages.tox
      python310Packages.setuptools
      python310Packages.pylint
      python310Packages.requests
      # Python dependency management and packaging made easy
      python310Packages.poetry-core
      # Jupyter lab environment notebook server extension
      # Uncompromising Python code formatter
      black
      # Linter for yaml files
      yamllint
      # Check websites for broken links
      linkchecker
    ];

    env.PIP_CONFIG_FILE = "$XDG_CONFIG_HOME/pip/pip.conf";
    env.PIP_LOG_FILE    = "$XDG_DATA_HOME/pip/log";
    env.PYLINTHOME      = "$XDG_DATA_HOME/pylint";
    env.PYLINTRC        = "$XDG_CONFIG_HOME/pylint/pylintrc";
    env.PYTHONSTARTUP   = "$XDG_CONFIG_HOME/python/pythonrc";
    env.PYTHON_EGG_CACHE = "$XDG_CACHE_HOME/python-eggs";

    environment.shellAliases = {
      py     = "python";
      po     = "poetry";
    };

    home.configFile = {
      "yamllint/yamllint.yml".source = "${configDir}/yamllint/yamllint.yml";
    };

    environment.shellAliases = {
      yamllint = "yamllint -c ~/${configDir}/yamllint/yamllint.yml";
    };
  };
}

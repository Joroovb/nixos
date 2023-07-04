{ config, lib, ... }:

with lib;
{
  networking.hosts =
    let hostConfig = {
          "192.168.8.1"   = [ "router" ];
          "192.168.8.8"   = [ "printer" ];
          "192.168.8.101" = [ "purple" ];
          "192.168.8.102" = [ "violet" ];
          "192.168.8.103" = [ "Lakka" ];
          "192.168.8.104" = [ "phone" ];
          "192.168.8.105" = [ "steamdeck" ];
          "192.168.8.106" = [ "raspberry" ];
          "192.168.8.107" = [ "grape" ];
          "192.168.8.108" = [ "sangria" ];
          "192.168.8.109" = [ "mulberry" ];
          "192.168.8.253" = [ "phone-work" ];
          "192.168.8.254" = [ "notebook-work" ];
        };
        hosts = flatten (attrValues hostConfig);
        hostName = config.networking.hostName;
    in mkIf (builtins.elem hostName hosts) hostConfig;

  ## Location config -- since Amsterdam is my 127.0.0.1
  time.timeZone = mkDefault "Europe/Amsterdam";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # For redshift, mainly
  # Go try find my home with those coordinates
  # as those are randomly picked within a range near my home
  location = (if config.time.timeZone == "Europe/Amsterdam" then {
    latitude = 47.064;
    longitude = 15.428;
  } else {});
}

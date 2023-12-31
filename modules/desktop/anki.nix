{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.anki;
in {
  options.modules.desktop.anki = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      # Spaced repetition flashcard program
      anki-bin
      # Simple program to convert markdown files into anki decks
      markdown-anki-decks
    ];
  };
}

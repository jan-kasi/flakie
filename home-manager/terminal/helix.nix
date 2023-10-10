{ inputs, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # General Helix settings
    settings = {
      theme = "base16_transparent";
      keys = { normal.esc = [ "collapse_selection" "keep_primary_selection" ]; };
      editor = {
        mouse = false;
        # line-number = "relative";
        statusline.left = [ "mode" "spinner" "file-type" ];
        statusline.center = [ "file-name" ];
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        true-color = true;
        color-modes = true;
        soft-wrap = {
          enable = true;
        };
      };
    };
    # Configure Language support
    languages = {
      language = [
        {
          name = "nix";
          # use nixpkgs-fmt when :format
          auto-format = true;
          formatter = { command = "nixpkgs-fmt"; };
        }
        # Markdowm marksman and nil LSP already configured by default
      ];
    };
  };
}

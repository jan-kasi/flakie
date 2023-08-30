{ inputs, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    defaultEditor = true;

    # General Helix settings
    settings = {
      theme = "gruvbox";
      keys = {
        normal.esc = [ "collapse_selection" "keep_primary_selection" ];
      };
      editor = {
        mouse = false;
        line-number = "relative";
        statusline.center = [ "file-type" ];
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        true-color = true;
        color-modes = true;
      };
    };

    # Configure Language support
    languages = {
      language = [
        # use nixpkgs-fmt when :format
        {
          name = "nix";
          formatter = { command = "nixpkgs-fmt"; };
        }
        # Markdowm marksman and nil LSP already configured by default
      ];
    };
  };
}
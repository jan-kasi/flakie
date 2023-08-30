{ inputs, pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    defaultEditor = true;

    # General Helix settings
    settings = {
      theme = "base16_transparent";
      keys = { normal.esc = [ "collapse_selection" "keep_primary_selection" ]; };
      editor = {
        mouse = false;
        line-number = "relative";
        soft-wrap = true;
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
        {
          name = "nix";
          # use nixpkgs-fmt when :format
          formatter = { command = "nixpkgs-fmt"; };
          # include the ";"
          auto-pairs = {
            "(" = ");";
            "{" = "};";
            "[" = "];";
          };
        }
        # Markdowm marksman and nil LSP already configured by default
      ];
    };
  };
}
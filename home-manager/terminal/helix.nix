{ inputs, pkgs, ... }: {
  programs.helix = {
    enable = true;
    extraPackages = [
      pkgs.marksman
      pkgs.markdown-oxide
      pkgs.fennel-ls
      pkgs.nil
      pkgs.fnlfmt
    ];
    # General Helix settings
    settings = {
      theme = "gruvbox-material";
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
      # Markdowm marksman and nil LSP already configured by default
      language = [
        {
          name = "nix";
          # use nixpkgs-fmt when :format
          auto-format = false;
          formatter = { command = "nixpkgs-fmt"; };
        }
        {
          name = "fennel";
          scope = "source.fnl";
          injection-regex = "(fennel|fnl)";
          file-types = [ "fnl" ];
          shebangs = [ "fnl" ];
          auto-format = false;
          formatter = { command = "fnlfmt"; args = [ "-" ]; };
          indent = { tab-width = 2; unit = "  "; };
          roots = [ ];
          grammar = "fennel";
          language-servers = [{ name = "fennel-ls"; }];
        }
      ];
      language-server.fennel-ls = { command = "fennel-ls"; };
      grammar = [
        {
          name = "fennel";
          source = {
            git = "https://github.com/travonted/tree-sitter-fennel";
            rev = "15e4f8c417281768db17080c4447297f8ff5343a";
          };
        }
      ];
    };
  };

  xdg.configFile."helix/runtime/queries/fennel/injections.scm".text = '' 
    ((comment) @injection.content
      (#set! injection.language "comment"))
  '';
  xdg.configFile."helix/runtime/queries/fennel/highlights.scm".text = ''
      (comment) @comment

    [ "(" ")" "{" "}" "[" "]" ] @punctuation.bracket

    [ ":" ":until" "&" "&as" "?" ] @punctuation.special

    (nil) @constant.builtin
    (vararg) @punctuation.special

    (boolean) @constant.builtin.boolean
    (number) @constant.numeric

    (string) @string
    (escape_sequence) @constant.character.escape


    ((symbol) @variable.builtin
     (#match? @variable.builtin "^[$]"))

    (binding) @symbol

    [ "fn" "lambda" "hashfn" "#" ] @keyword.function

    (fn name: [
      (symbol) @function
      (multi_symbol (symbol) @function .)
    ])

    (lambda name: [
      (symbol) @function
      (multi_symbol (symbol) @function .)
    ])

    (multi_symbol
      "." @punctuation.delimiter
      (symbol) @variable.other.member)

    (multi_symbol_method
      ":" @punctuation.delimiter
      (symbol) @function.method .)

    [ "for" "each" ] @keyword.control.repeat
    ((symbol) @keyword.control.repeat
     (#eq? @keyword.control.repeat
      "while"))

    [ "match" ] @keyword.control.conditional
    ((symbol) @keyword.control.conditional
     (#match? @keyword.control.conditional "^(if|when)$"))

    [ "global" "local" "let" "set" "var" "where" "or" ] @keyword
    ((symbol) @keyword
     (#match? @keyword
      "^(comment|do|doc|eval-compiler|lua|macros|quote|tset|values)$"))

    ((symbol) @keyword.control.import
     (#match? @keyword.control.import
      "^(require|require-macros|import-macros|include)$"))

    [ "collect" "icollect" "accumulate" ] @function.macro
    ((symbol) @function.macro
     (#match? @function.macro
      "^(->|->>|-\\?>|-\\?>>|\\?\\.|doto|macro|macrodebug|partial|pick-args|pick-values|with-open)$"))

    ; Lua builtins
    ((symbol) @constant.builtin
     (#match? @constant.builtin
      "^(arg|_ENV|_G|_VERSION)$"))

    ((symbol) @function.builtin
     (#match? @function.builtin
      "^(assert|collectgarbage|dofile|error|getmetatable|ipairs|load|loadfile|loadstring|module|next|pairs|pcall|print|rawequal|rawget|rawlen|rawset|require|select|setfenv|setmetatable|tonumber|tostring|type|unpack|warn|xpcall)$"))

    (list . (symbol) @function)
    (list . (multi_symbol (symbol) @function .))
    (symbol) @variable
  '';
}

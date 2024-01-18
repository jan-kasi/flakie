{ config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi.theme = {
    "*" = {
      BG = mkLiteral "#11111Bff";
      BGA = mkLiteral "#b4befeff";
      FG = mkLiteral "#D9E0EEff";
      FGA = mkLiteral "#b4befeff";
      BDR = mkLiteral "#b4befeff";
      SEL = mkLiteral "#1E1E2Eff";
      UGT = mkLiteral "#F28FADff";
      IMG = mkLiteral "#b4befeff";
      OFF = mkLiteral "#575268ff";
      ON = mkLiteral "#ABE9B3ff";
    };

    window = {
      transparency = "real";
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@FG";
      border = mkLiteral "2px";
      border-color = mkLiteral "@BDR";
      border-radius = mkLiteral "5px";
      width = mkLiteral "750px";
      anchor = mkLiteral "center";
      x-offset = mkLiteral "0";
      y-offset = mkLiteral "-50";
    };

    prompt = {
      enabled = mkLiteral "true";
      padding = mkLiteral "8px";
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@IMG";
    };

    textbox-prompt-colon = {
      expand = mkLiteral "false";
      str = " ";
      border-radius = mkLiteral "100%";
      background-color = mkLiteral "@SEL";
      text-color = mkLiteral "@FG";
      padding = mkLiteral "8px 12px 8px 12px";
    };

    entry = {
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@FG";
      placeholder-color = mkLiteral "@FG";
      expand = mkLiteral "true";
      horizontal-align = mkLiteral "0";
      placeholder = "Search...";
      blink = mkLiteral "true";
      border = mkLiteral "0px 0px 2px 0px";
      border-color = mkLiteral "@BDR";
      border-radius = mkLiteral "10px";
      padding = mkLiteral "8px";
    };

    inputbar = {
      children = map mkLiteral [ "prompt" "entry" ];
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@FG";
      expand = mkLiteral "false";
      border = mkLiteral "0px 0px 0px 0px";
      border-radius = mkLiteral "0px";
      border-color = mkLiteral "@BDR";
      margin = mkLiteral "0px 0px 0px 0px";
      padding = mkLiteral "0px";
      position = mkLiteral "center";
    };

    case-indicator = {
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@FG";
      spacing = mkLiteral "0";
    };

    listview = {
      background-color = mkLiteral "@BG";
      columns = mkLiteral "1";
      lines = mkLiteral "10";
      spacing = mkLiteral "4px";
      cycle = mkLiteral "true";
      dynamic = mkLiteral "true";
      layout = mkLiteral "vertical";
    };

    mainbox = {
      children = map mkLiteral [ "inputbar" "listview" ];
      background-color = mkLiteral "@BG";
      spacing = mkLiteral "15px";
      padding = mkLiteral "15px";
    };

    element = {
      background-color = mkLiteral "@BG";
      text-color = mkLiteral "@FG";
      orientation = mkLiteral "horizontal";
      border-radius = mkLiteral "4px";
      padding = mkLiteral "6px 6px 6px 6px";
    };

    element-icon = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
      horizontal-align = mkLiteral "0.5";
      vertical-align = mkLiteral "0.5";
      size = mkLiteral "24px";
      border = mkLiteral "0px";
    };

    element-text = {
      background-color = mkLiteral "inherit";
      text-color = mkLiteral "inherit";
      expand = mkLiteral "true";
      horizontal-align = mkLiteral "0";
      vertical-align = mkLiteral "0.5";
      margin = mkLiteral "2px 0px 2px 2px";
    };

    "element normal.urgent, element alternate.urgent" = {
      background-color = mkLiteral "@UGT";
      text-color = mkLiteral "@FG";
      border-radius = mkLiteral "9px";
    };

    "element normal.active, element alternate.active" = {
      background-color = mkLiteral "@BGA";
      text-color = mkLiteral "@FG";
    };

    "element selected" = {
      background-color = mkLiteral "@BGA";
      text-color = mkLiteral "@SEL";
      border = mkLiteral "0px 0px 0px 0px";
      border-radius = mkLiteral "10px";
      border-color = mkLiteral "@BDR";
    };

    "element selected.urgent" = {
      background-color = mkLiteral "@UGT";
      text-color = mkLiteral "@FG";
    };

    "element selected.active" = {
      background-color = mkLiteral "@BGA";
      color = mkLiteral "@FG";
    };
  };
}

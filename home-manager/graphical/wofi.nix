{
  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 250;
      location = "top";
      yoffset = 200;
      show = "drun";
      prompt = "";
      lines = 10;
      filter_rate = 100;
      allow_markup = true;
      parse_action = false;
      key_expand = "Alt_L";
      halign = "fill";
      orientation = "vertical";
      insensitive = true;
      allow_images = true;
      gtk_dark = true;
    };
    style = ''
      /* Mocha Lavender */
      @define-color accent #babbf1;
      @define-color txt #cad3fr;
      @define-color bg rgba(36, 39, 58, 1.0);
      @define-color bg2 rgba(73, 77, 100, 1.0);

       * {
            font-family: 'MesloLGS NF', monospace;
            font-size: 14px;
       }

       /* Window */
       window {
          margin: 0px;
          padding: 10px;
          border: 3px solid @accent;
          border-radius: 7px;
          background-color: @bg;
          animation: slideIn 0.1s ease-in-out both;
       }

       /* Slide In */
       @keyframes slideIn {
          0% {
             opacity: 0;
          }

          100% {
             opacity: 1;
          }
       }

       /* Inner Box */
       #inner-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @bg;
          animation: fadeIn 0.1s ease-in-out both;
       }

       /* Fade In */
       @keyframes fadeIn {
          0% {
             opacity: 0;
          }

          100% {
             opacity: 1;
          }
       }

       /* Outer Box */
       #outer-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @bg;
       }

       /* Scroll */
       #scroll {
          margin: 0px;
          padding: 10px;
          border: none;
       }

       /* Input */
       #input {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @accent;
          background-color: @bg2;
          animation: fadeIn 0.1s ease-in-out both;
       }

       /* Text */
       #text {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @txt;
          animation: fadeIn 0.1s ease-in-out both;
       }

       /* Selected Entry */
       #entry:selected {
         background-color: @accent;
       }

       #entry:selected #text {
          color: @bg;
       }
    '';
  };
}

{
  programs.wofi = {
    enable = true;
    settings = {
      width = 800;
      height = 500;
      location = "top";
      yoffset = 200;
      show = "drun";
      prompt = "";
      lines = 13;
      filter_rate = 100;
      allow_markup = true;
      always_parse_args = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      gtk_dark = true;
    };
    style = ''
      * {
      font-family: 'MesloLGS NF Bold';
      font-size: 15px;
      font-weight: 600;
      }


      #window {
          margin: 0px;
          border: 0.0px solid;
          border-color: rgb(235, 77, 129);
          border-radius: 10px;
          background-color: #8C7C73;
          color:  /*rgb(235, 77, 129)*/ #f1f1f1;
      }

      #input {
          margin: 15px;
          background-color: rgb(112, 122, 137);
          color: rgb(37, 38, 51);
          border-radius: 25px;
          border: 2px solid rgb(52, 64, 76);
      }

      #scroll {
          margin-bottom: 15px;
      }

      #entry {
          margin: 0px 15px;
      }

      #entry:selected {
          /*background-color: /*rgb(245, 98, 36);*/
          background-color: #F59251;
          border-radius: 0px;
          border: none;
          outline: none;
      }

      #entry > box {
          margin-left: 16px;
      }

      #entry image {
          padding-right: 10px;
      }

      #colors {
          color: rgb(37, 38, 51);
          color: rgb(52, 64, 76);
          color: rgb(76, 90, 107);
          color: rgb(112, 122, 137);
          color: rgb(235, 77, 129);
          color: rgb(245, 98, 36);
      }
    '';
  };
}

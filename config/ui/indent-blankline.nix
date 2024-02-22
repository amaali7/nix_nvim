{
  plugins = {
    indent-blankline = {
      enable = true;
      #  indent = {
      #   char = "│"; # "│" or "▎"
      # };
      scope = {
        enabled = true;
        showStart = true;
      };
      exclude = {
        buftypes = [ "terminal" "nofile" ];
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "NvimTree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
        ];
      };
    };
  };
}

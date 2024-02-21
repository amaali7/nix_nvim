{
  plugins = {
    nix.enable = true;
    notify = {
      enable = true;
      #backgroundColour = "#000000";
      fps = 120;
      stages = "fade";
    };
    nvim-autopairs = {
      enable = true;
      checkTs = true;
    };
    rustaceanvim.enable = true;

    oil.enable = true;
    treesitter.enable = true;
    which-key.enable = true;
  };

}

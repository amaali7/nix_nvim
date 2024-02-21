{ pkgs, inputs, ... }:
let
  decay-vim = pkgs.vimUtils.buildVimPlugin {
    name = "decay-nvim";
    src = inputs.decay-vim;
  };
in {
  extraPlugins = with pkgs.vimPlugins; [ decay-vim ];
  colorscheme = "decayce";
}

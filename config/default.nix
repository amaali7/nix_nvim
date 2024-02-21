{ pkgs, inputs, ... }:
let
  colorscheme = (import ./colorschemes/decay.nix) { inherit pkgs inputs; }; # import the module directly
  snippets = (import ./snippets/luasnip.nix) { inherit pkgs; }; # import the module directly
  staline = (import ./statusline/staline.nix) { inherit pkgs; }; # import the module directly
in
{
  # Import all your configuration modules here
  imports = [
    ./bufferlines/bufferline.nix
    colorscheme
    ./completion/cmp.nix
    ./completion/copilot.nix
    ./completion/lspkind.nix
    ./dap/dap.nix
    ./filetrees/nvimtree.nix
    ./git/diffview.nix
    ./git/lazygit.nix
    ./git/gitsigns.nix
    ./languages/nvim-lint.nix
    ./languages/treesitter/treesitter-context.nix
    ./languages/treesitter/treesitter.nix
    ./languages/treesitter/treesitter-textobjects.nix
    ./languages/treesitter/ts-autotag.nix
    ./languages/treesitter/ts-context-commentstring.nix

    ./lsp/lsp.nix
    ./lsp/fidget.nix
    ./lsp/conform.nix
    ./lsp/lspsaga.nix
    ./lsp/trouble.nix
    snippets
    ./statusline/lualine.nix
    staline

    ./telescope/telescope.nix

    ./ui/alpha.nix
    ./ui/dressing-nvim.nix

    #./keymaps.nix
    #./options.nix
    #./autocmd.nix
    #./plugins.nix
  ];
  clipboard.providers.xclip.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    telescope-ui-select-nvim
    telescope-project-nvim
    vim-autoformat
    vim-jsbeautify
  ];
}

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

    # UI 
    ./ui/nui.nix
    ./ui/alpha.nix
    ./ui/noice.nix
    ./ui/nvim-notify.nix
    ./ui/dressing-nvim.nix
    ./ui/indent-blankline.nix

    # Utils
    ./utils/better-escape.nix
    ./utils/flash.nix
    ./utils/hardtime.nix
    ./utils/harpoon.nix
    ./utils/illuminate.nix
    ./utils/markdown-preview.nix
    ./utils/mini.nix
    # ./utils/neocord.nix
    ./utils/neodev.nix
    ./utils/neotest.nix
    ./utils/nvim-autopairs.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-surround.nix
    ./utils/oil.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/project-nvim.nix
    ./utils/sidebar.nix
    ./utils/todo-comments.nix
    ./utils/toggleterm.nix
    ./utils/ultimate-autopair.nix
    ./utils/undotree.nix
    ./utils/vim-be-good.nix
    # ./utils/wakatime.nix
    ./utils/whichkey.nix
    ./utils/wilder.nix


    ./keymaps.nix
    ./options.nix
    ./autocmd.nix
    ./plugins.nix
    ./sets.nix
  ];
  clipboard.providers.xclip.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    telescope-ui-select-nvim
    telescope-project-nvim
    vim-autoformat
    vim-jsbeautify
  ];
}

{
  plugins.nvim-tree = {
    enable = true;
   };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":NvimTreeFocus <cr>";
      options = {
        silent = true;
        desc = "Explorer NvimTree (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>E";
      action = ":NvimTreeToggle <cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (cwd)";
      };
    }
  ];
}

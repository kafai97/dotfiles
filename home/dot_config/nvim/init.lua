if vim.g.vscode then
  -- VSCode extension
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  -- ordinary Neovim
  require("config.lazy")
end

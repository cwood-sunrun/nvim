local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  print("No packer")
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("christoomey/vim-tmux-navigator")
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use("slobodanzivanovic/velvet.nvim")
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- manage and install lsp service
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configure lsp servers
  use("neovim/nvim-lspconfig")


  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- fuzzy finder
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

  if packer_bootstrap then
    require("packer").sync()
  end
end
)

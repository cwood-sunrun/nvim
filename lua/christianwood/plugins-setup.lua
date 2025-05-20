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

  use({
    "zenbones-theme/zenbones.nvim",
    requires = { "rktjmp/lush.nvim" }
  })
  -- use('folke/tokyonight.nvim')
  -- use({ 
  -- 'olivercederborg/poimandres.nvim',
  --   config = function()
  --     require('poimandres').setup {
  --       -- leave this setup function empty for default config
  --     }
  --   end
  -- })

  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()

  -- manage and install lsp service
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configure lsp servers
  use( "neovim/nvim-lspconfig" )

  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  })

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  use ({
    'notjedi/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
  })

  -- lsp windows 
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})
  use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

  -- Zen mode
  use("folke/zen-mode.nvim")

  use { "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" }
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end
)


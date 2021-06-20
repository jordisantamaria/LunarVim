local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {"neovim/nvim-lspconfig", opt = true}
        use {"glepnir/lspsaga.nvim", opt = true}
		-- use {'glepnir/lspsaga.nvim', branch = 'enhance-window'}
        use {"kabouzeid/nvim-lspinstall", opt = true}

        -- Telescope
        use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true}
        use {"nvim-telescope/telescope.nvim", opt = true}
		-- use 'nvim-telescope/telescope-media-files.nvim'

        -- Debugging
        use {"mfussenegger/nvim-dap", opt = true}

        -- Autocomplete
        use {"hrsh7th/nvim-compe", opt = true}
        use {"hrsh7th/vim-vsnip", opt = true}
        use {"rafamadriz/friendly-snippets", opt = true}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"windwp/nvim-ts-autotag", opt = true}
		use 'nvim-treesitter/playground'

        -- Explorer
        use "kyazdani42/nvim-tree.lua"
        -- TODO remove when open on dir is supported by nvimtree
        use "kevinhwang91/rnvimr"

        -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
        use {"folke/which-key.nvim", opt = true}
        use {"ChristianChiarulli/dashboard-nvim", opt = true}
        use {"windwp/nvim-autopairs", opt = true}
        use {"terrortylor/nvim-comment", opt = true}

        -- Color
		use 'jordisantamaria/nvcode-color-schemes.vim'
		use 'norcalli/nvim-colorizer.lua'

		-- Icons
		use {"kyazdani42/nvim-web-devicons", opt = true}

		-- Status Line and Bufferline
		use {"glepnir/galaxyline.nvim", opt = true}
		use {"romgrk/barbar.nvim", opt = true}

			-- Git
		use {"lewis6991/gitsigns.nvim", opt = true}
		use 'tpope/vim-fugitive'
		use 'tpope/vim-rhubarb'
		use 'tommcdo/vim-fubitive'
		use 'rhysd/git-messenger.vim'

		-- Registers
		-- use 'gennaro-tedesco/nvim-peekup'


		-- Navigation
		use 'unblevable/quick-scope'
		use {'phaazon/hop.nvim', branch = 'e5eb06d6f3caff15f3abd35c6c21135f93fa4eb7'}

		-- Object and motions

		-- common utils for textobj plugins
		use 'kana/vim-textobj-user'
		-- Object for file ae, file no empty lines ie
		use 'kana/vim-textobj-entire'
		-- Object for search, i/ a/
		use 'kana/vim-textobj-lastpat'
		-- For select text on same indent level with ai
		use 'kana/vim-textobj-indent'
		-- Object for select a line, al with identation, il without identation
		use 'kana/vim-textobj-line'
		-- Object for select a variable segment, so snake case or camel case segment, with iv or av
		use 'Julian/vim-textobj-variable-segment'
		-- Motion for camelcase snakecase part
		use 'bkad/CamelCaseMotion'

		-- General enhancements

		-- Search visual text selected with *
		use 'jordisantamaria/vim-visual-star-search'
		-- For better abrev and change snake_case to camelCase with crs, crc
		use 'tpope/vim-abolish'
		-- file system
		use 'jordisantamaria/vim-file-utils'
		-- Auto save buffer and session
		use 'jordisantamaria/vim-workspace'
		use 'tpope/vim-surround'
		--  Repeat stuff
		use 'tpope/vim-repeat'
		-- Csv rainbow
		use 'mechatroner/rainbow_csv'
		-- Move between vim windows and tmux panes with same keys
		use 'christoomey/vim-tmux-navigator'

		-- General Plugins
		use 'kevinhwang91/nvim-bqf'
		-- For find in quickfix
		use 'jremmen/vim-ripgrep'
		-- For use fuzy finder in quickfix
		use 'junegunn/fzf'
		use 'airblade/vim-rooter'
		use 'metakirby5/codi.vim'
		use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
		use 'voldikss/vim-floaterm'
		use 'monaqa/dial.nvim'
		use 'junegunn/goyo.vim'
		use 'andymass/vim-matchup'
		use 'turbio/bracey.vim'
		-- learn vim movements
		use 'tjdevries/train.nvim'
		-- For inteligent auto identation
		use 'tpope/vim-sleuth'
		use 'Asheq/close-buffers.vim'

		-- Database
		use 'tpope/vim-dadbod'
		use 'kristijanhusak/vim-dadbod-ui'
		use 'kristijanhusak/vim-dadbod-completion'


        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")
        require_plugin("friendly-snippets")
        require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        require_plugin("telescope.nvim")
        require_plugin("nvim-dap")
        require_plugin("nvim-compe")
        require_plugin("vim-vsnip")
        require_plugin("nvim-treesitter")
        require_plugin("nvim-ts-autotag")
        require_plugin("nvim-tree.lua")
        require_plugin("gitsigns.nvim")
        require_plugin("which-key.nvim")
        require_plugin("dashboard-nvim")
        require_plugin("nvim-autopairs")
        require_plugin("nvim-comment")
        require_plugin("nvim-bqf")
        require_plugin("nvcode-color-schemes.vim")
        require_plugin("nvim-web-devicons")
        require_plugin("galaxyline.nvim")
        require_plugin("barbar.nvim")
    end
)

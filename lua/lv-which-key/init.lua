require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
			operators = false, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>n', ':let @/ = ""<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- dashboard
-- vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- markdown preview
vim.api.nvim_set_keymap('n', '<Leader>m', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})

-- Ranger
vim.api.nvim_set_keymap('n', '<Leader>o', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- Ranger
vim.api.nvim_set_keymap('n', '<Leader>T', ':TSHighlightCapturesUnderCursor<CR>', {noremap = true, silent = true})
-- TODO create entire treesitter section

local mappings = {
    ["/"] = "Comment",
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["n"] = "No Highlight",
	["m"] = "Markdown Preview",
	["o"] = "Ranger",
	["T"] = "Treesitter highlight",
	["v"] = {"<C-W>v", "Split vertical"},
	["h"] = {"<C-W>s", "Split horizontal"},
	["z"] = {":Goyo<CR>", "Zen"},
    a = {
        name = "+Actions",
        v = {":Codi<CR>", "Virtual REPL on"},
        V = {":Codi!<CR>", "Virtual REPL off"},
        l = {":Bracey<CR>", "Html live server"},
        L = {":BraceyStop<CR>", "Html live server"},
        w = {":TrainWord<CR>", "Train word"},
        m = {":TrainUpDown<CR>", "Train line"},
		o = {":TrainTextObj<CR>", "Train Object"},
    },
    b = {
        name = "+Buffer",
        ["1"] = {":BufferGoto 1<CR>", "Buffer 1"},
        ["2"] = {":BufferGoto 2<CR>", "Buffer 2"},
        ["3"] = {":BufferGoto 3<CR>", "Buffer 3"},
        ["4"] = {":BufferGoto 4<CR>", "Buffer 4"},
        ["5"] = {":BufferGoto 5<CR>", "Buffer 5"},
        ["6"] = {":BufferGoto 6<CR>", "Buffer 6"},
        ["7"] = {":BufferGoto 7<CR>", "Buffer 7"},
        ["8"] = {":BufferGoto 8<CR>", "Buffer 8"},
        ["9"] = {":BufferGoto 9<CR>", "Buffer 9"},
        d = {":BufferClose<CR>", "delete-buffer"},
        o = {":Bdelete hidden<CR>", "Delete all but current"},
        a = {":Bdelete all<CR>", "Delete all buffers"},
        h = {":TSBufToggle highlight<CR>", "Toogle treesitter highlight"},
    },
    d = {
        name = "+Database",
        t = {":DBUIToggle<CR>", "db ui toogle"},
        f = {":DBUIFindBuffer<CR>", "db find buffer"},
        r = {":DBUIRenameBuffer<CR>", "db rename buffer"},
        l = {":DBUILastQueryInfo<CR>", "db last buffer"},
    },
    g = {
        name = "+Git",
        b = {":Gblame<CR>", "blame"},
        B = {":GBrowse<CR>", "browser current file"},
        d = {":Gdiffsplit<CR>", "diff split"},
        D = {":Git diff<CR>", "diff"},
		p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {":ResetBuffer<CR>", "Reset buffer"},
        s = {":Gstatus<CR>", "status"},
        m = {"<Plug>(git-messenger)", "message"},
        ["1"] = {":diffget //2<CR>", "Diffget left"},
        ["3"] = {":diffget //3<CR>", "Diffget right"},
        o = {":!sh ~/scripts/open-repository.sh<CR>", "Open repo"},
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
        y = {":e ~/.config/nvim/lua/lsp/yaml-ls.lua<CR>", "Yaml config"}
    },
    q = {
        name = "+Quickfix",
        n = {":cnext<CR>"        , "cnext"},
        p = {":cprev<CR>"        , "cprev"},
        o = {":copen<CR>"        , "copen"},
        q = {":cclose<CR>"       , "cclose"},
        l = {":clast<CR>"        , "clast"},
        w = {":Rg<CR>"           , "find cursor word"},
        g = {":Glog %<CR>"       , "File git history"},
    },
    s = {
        name = "+Search",
        b = {"<cmd>Telescope git_branches<cr>", "File"},
        s = {"<cmd>Telescope git_status<cr>", "Git status"},
        c = {"<cmd>Telescope git_commits<cr>", "Git commits"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Git branch commits"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        h = {"<cmd>Telescope command_history<cr>", "History"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        o = {"<cmd>Telescope vim_options<cr>", "vim_options"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"}
    },
    t = {
        name = "+Terminal",
        [";"] = {":FloatermNew --wintype=normal --height=8<CR>", "Terminal"},
        n = {":FloatermNew node<CR>", "Node"},
        f = {":FloatermNew python<CR>", "Python"},
        t = {":FloatermToggle<CR>", "Python"},
    },


    c = {
        name = "+Cheatsheets",
        c = {":e ~/projects/cheatsheets/cleanCode/index.md<CR>", "Clean code"},
        r = {":e ~/projects/cheatsheets/resources/index.md<CR>", "Resources"},
        d = {":e ~/projects/cheatsheets/docker/index.md<cr>", "Docker"},
        p = {":e ~/projects/cheatsheets/python/index.md<cr>", "Python"},
        v = {":e ~/projects/cheatsheets/vue/index.md<cr>", "Vue"},
        s = {":e ~/projects/cheatsheets/ddd/index.md<cr>", "Software structure"},
        a = {":e ~/projects/cheatsheets/aws/index.md<cr>", "Aws"},
        t = {":e ~/projects/cheatsheets/bash/tmux.md<cr>", "Tmux"},
        b = {":e ~/projects/cheatsheets/bash/index.md<cr>", "Bash"},
        m = {":e ~/projects/cheatsheets/markdown/README.md<cr>", "Markdown"},
        n = {":e ~/projects/cheatsheets/bash/vim/mappings.md<cr>", "Nvim"},
        q = {":e ~/projects/cheatsheets/postgres/index.md<cr>", "postgresql"},
    },
    p = {
        name = "+Personal",
        w = {":e ~/personal/daily_objectives.md<cr>", "Daily objectives"},
        f = {":e ~/personal/feedback.md", "Feedback<cr>"},
        n = {":e ~/personal/notes.md<cr>", "Notes"},
        l = {":e ~/personal/mindvalley/lifebook.md<cr>", "Lifebook"},
        j = {":e ~/personal/vocabulary/japanese.csv<cr>", "Japense learning"},
        J = {":e ~/personal/vocabulary/japanese_backlog.csv<cr>", "Japense backlog"},
        e = {":e ~/personal/vocabulary/english.csv<cr>", "English learning"},
        E = {":e ~/personal/vocabulary/english_backlog.csv<cr>", "English backlog"},
        t = {":e ~/personal/things.md<cr>", "Things"},
    },
}

local wk = require("which-key")
wk.register(mappings, opts)

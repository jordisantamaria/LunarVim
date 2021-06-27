command! LspCodeAction lua require 'lv-utils'.code_action()
command! LspDeclaration lua require 'lv-utils'.declaration()
command! LspDefinition lua require 'lv-utils'.definition()
command! LspDocumentSymbol lua require 'lv-utils'.document_symbol()
command! LspFormatting lua require 'lv-utils'.formatting()
command! LspFormattingSync lua require 'lv-utils'.formatting_sync()
command! LspHover lua require 'lv-utils'.hover()
command! LspImplementation lua require 'lv-utils'.implementation()
command! LspRangeCodeAction lua require 'lv-utils'.range_code_action()
command! LspRangeFormatting lua require 'lv-utils'.range_formatting()
command! LspReferences lua require 'lv-utils'.references()
command! LspRename lua require 'lv-utils'.rename()
command! LspTypeDefinition lua require 'lv-utils'.type_definition()
command! LspWorkspaceSymbol lua require 'lv-utils'.workspace_symbol()
command! LspGotoNext lua require 'lv-utils'.goto_next()
command! LspGotoPrev lua require 'lv-utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'lv-utils'.show_line_diagnostics()
command! NextHunk lua require 'lv-utils'.next_hunk()
command! PrevHunk lua require 'lv-utils'.prev_hunk()
command! StageHunk lua require 'lv-utils'.stage_hunk()
command! UndoStageHunk lua require 'lv-utils'.undo_stage_hunk()
command! ResetHunk lua require 'lv-utils'.reset_hunk()
command! ResetBuffer lua require 'lv-utils'.reset_buffer()
command! PreviewHunk lua require 'lv-utils'.preview_hunk()
command! BlameLine lua require 'lv-utils'.blame_line()
" command! W noa w

" Debugging
command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
command! DebugStart lua require'dap'.continue()
command! DebugContinue lua require'dap'.continue()
command! DebugStepOver lua require'dap'.step_over()
command! DebugStepOut lua require'dap'.step_out()
command! DebugStepInto lua require'dap'.step_into()
command! DebugToggleRepl lua require'dap'.repl.toggle()
command! DebugGetSession lua require'dap'.session()

" Available Debug Adapters:
"   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
" 
" Adapter configuration and installation instructions:
"   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
" 
" Debug Adapter protocol:
"   https://microsoft.github.io/debug-adapter-protocol/

" TODO Add full support later
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()

autocmd User GoyoEnter set laststatus=0 
autocmd User GoyoLeave set laststatus=2

" autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
" autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()

function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

let g:goyo_width=120
let g:goyo_height=95

augroup cloudformation
	au!
	au BufNewFile,BufRead *.yaml,*.yml set filetype=cloudformation
augroup ENDV

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = "both"

" Navigate in command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let g:workspace_autosave_always = 1
let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = $HOME . '/.vim/undo/'
" let g:workspace_autosave_ignore = ['TelescopePrompt', 'NvimTree', '無名', '[Command Line]', 'vim', 'ignored', 'qf']
let g:nvim_tree_width = 45 "30 by default
let g:nvim_tree_ignore = [ '.git', '.idea', '.cache', '.undodir' ] "empty by default
let g:workspace_autosave_files = ['python', 'typescript', 'yaml', 'yml', 'javascript', 'json', 'lua', 'vue', 'markdown', 'make', 'toml', 'sh', 'csv', 'zsh', 'conf', 'dockerfile']
let g:workspace_only_git_dir = 1

function! CleanupStuff()
	NvimTreeClose
endfunction

autocmd VimLeavePre * call CleanupStuff()

"Heading === line object
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rvg_"<cr>


" vim hardcodes background color erase even if the terminfo file does
    " not contain bce (not to mention that libvte based terminals
    " incorrectly contain bce in their terminfo files). This causes
    " incorrect background rendering when using a color theme with a
    " background color
	let &t_ut=''

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

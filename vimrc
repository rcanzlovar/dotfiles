
let @o = 'I<p style="text-align: center;">'
let @c = 'A</p>'
" fix EMdash control characters from facebook posts
command! FixEmDash %s/\%xe2\%x80\%x94/--/g

" fix apostrophes 
command! FixApostrophe %s/\%xe2\%x80\%x99/'/g | %s/\%xe2\%x80\%x98/'/g

" insert today's date 
command! InsertDate execute "normal! i" . strftime("%Y-%m-%d")
command! IDate execute "normal! i" . strftime("%e-%b-%Y")
" -----------------------------------------------------------------------------
" Frontmatter Stub Command
" -----------------------------------------------------------------------------
"
" Creates a mapping to insert a YAML frontmatter stub for blog posts or
" static site generator pages.
"
" USAGE: In Normal mode, type `<Leader>fm`
"
" NOTE: The <Leader> key is the `\` key by default. You can change it by
" adding this to the top of your .vimrc: `let mapleader = ","`
"
" EXPLANATION:
"   nnoremap     - A non-recursive mapping for Normal mode. Best practice.
"   <silent>     - Prevents the command from being echoed at the bottom.
"   <Leader>fm   - The key sequence to trigger the command ("frontmatter").
"   i---\<CR>... - Enters Insert mode and types out the text.
"   \=strftime() - This is a Vim expression that executes the strftime
"                  function to get the current date in YYYY-MM-DD format.
"   <Esc>        - Exits Insert mode.
"   4kA          - Moves the cursor up 4 lines and enters Insert mode at
"                  the end of the `title:` line, ready for you to type.

nnoremap <silent> <Leader>fm i---\<CR>
            \ title: <CR>
            \ date: \=strftime('%Y-%m-%d')<CR>
            \ published: false<CR>
            \ keywords: []<CR>
            \ ---<CR>
            \ <Esc>4kA

" fix some common misspellings 
:iab teh the
:iab wiht with


" -----------------------------------------------------------------------------
" Insert Frontmatter Command
" -----------------------------------------------------------------------------
"
" Creates a custom command `:IFront` to insert a YAML frontmatter stub at
" the top of the file.
"
" USAGE: In Normal mode, type `:IFront` and press Enter.

" Define a function to hold the logic. This is cleaner and more extensible.
function! InsertFrontmatter()
    " Create a list of lines for the frontmatter.
    " This makes it very easy to add or change lines later.
    let frontmatter_lines = [
    \   '---',
    \   'title: ',
    \   'date: ' . strftime('%Y-%m-%d'),
    \   'published: true',
    \   'keywords: []',
    \   '---',
    \   '' 
    \ ]

    " Adds a blank line after the frontmatter for spacing
    "
    " Use the append() function to add these lines at the very top of the
    " file (line 0).
    call append(0, frontmatter_lines)

    " Move the cursor to the 'title:' line (which is now line 2).
    call cursor(2, 0)

    " Go to the end of that line and enter Insert mode.
    startinsert!
endfunction

" Create the custom command that calls our function.
" The '!' allows the command to be redefined if you reload your .vimrc.
command! IFront call InsertFrontmatter()
command! Bpublish %s/published: false//published: true/



set autoindent

:iab Iemail rcanzlovar@gmail.com
:iab lmod last_modified_on: <C-R>=strftime('%Y-%m-%d')<CR>
:iab ldate date: <C-R>=strftime('%Y-%m-%d')<CR>

":iab ldate  <C-R>=strftime('%Y-%m-%d')<CR>

set expandtab       " Convert tabs to spaces
set tabstop=4       " A tab is 4 spaces
set shiftwidth=4    " Indent with 4 spaces
set softtabstop=4   " Makes backspacing work correctly

" Set indentation to 4 spaces for python scripts
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" Set indentation to 4 spaces for Perl and Shell scripts
autocmd FileType perl,sh,bash setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8


" make paragraphs out of long lines with a blank line so they will show as paragraphs
" Add a blank line after every non-empty line
command! -range MarkdownParagraphs <line1>,<line2>g/\S/normal o

" Clean up Facebook redirect URLs in the current buffer
command! CleanFbUrl %s/^.*u=\([^&]*\)&.*$/\1/ | %!python3 -c "import sys, urllib.parse as u; print(u.unquote(sys.stdin.read()), end='')"


" rerun vimrc :so ~/.vimrc

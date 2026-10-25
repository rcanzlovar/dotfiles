

" highlight syntax if appropriate
syntax on


" Increase command and search history limit (default is 50 or 200)
set history=1000

" Persist history, marks, and registers across Vim restarts
set viminfo='100,<1000,s10,h


let @o = 'I<p style="text-align: center;">'
let @c = 'A</p>'
" fix EMdash control characters from facebook posts
command! FixEmDash %s/\%xe2\%x80\%x94/--/g

""" ==========================================
""" functions for fixing PDF -> HTML -> markdown
function! LinkPrep()
    let l:save_search = @/
    let l:save_pos = getpos('.')

""" Prepend [ to upcoming links
    keepjumps %s/\(<b>\)\(.*\)\(<\/b>\)\( @@\d*\)/\1[\2\4\3/
    keepjumps %s/\(<i>\)\(.*\)\(<\/i>\)\( @@\d*\)/\1[\2\4\3/

    let @/ = l:save_search
    call setpos('.', l:save_pos)
endfunction

function! LinkPrepx()
    let l:save_search = @/
    let l:save_pos = getpos('.')

""" change the link to something i like
    keepjumps %s/\v\<li\>\<a href\="index\.html#([^"]+)"\>([^<]+)\<\/a\>\<\/li\>/<li>[\2 \@\@\1 <\/li>/g
""" change the target to something i like:
    keepjumps %s/\v(class\="section" id\=")([a-zA-Z0-9\-]*)("\>)/\1\2\3ZZZ \2 YYY/g


"""    keepjumps %s/<dt>(.*)<\/dt>/<h3>\1<\/h3>/g
    keepjumps %s#</dt>#</h3>#g
    keepjumps %s#<dt>#<h3>#g



    let @/ = l:save_search
    call setpos('.', l:save_pos)
endfunction





function! AfterMD()
    let l:save_search = @/
    let l:save_pos = getpos('.')

    keepjumps %s/ @@\([a-z0-9-]\+\)/](#\1)/

    keepjumps %s/ZZZ /<a name=/g
    keepjumps %s/ YYY/><\/a>/g

"""    keepjumps %s/\v\(index\.html(#[a-zA-Z0-9\-]\))/\1)  /g
""" if index.html exists, edit it out. e suppresses error
    keepjumps %s/index.html//ge
    keepjumps %s/\v\)([a-zA-Z])/) \1/


    let @/ = l:save_search
    call setpos('.', l:save_pos)

    call InsertFrontMatter()
endfunction


""" add HTML tags 
" Prompt for a tag and wrap the visual selection
function! WrapTag()
  let tag = input('Tag name: ')
  if !empty(tag)
    let save_reg = @"
    normal! gvy
    let @" = '<' . tag . '>' . @" . '</' . tag . '>'
    normal! gvp
    let @" = save_reg
  endif
endfunction

""" make wraptag use \t
xnoremap <leader>t :<C-u>call WrapTag()<CR>
""" ==========================================

" fix apostrophes 
command! FixApostrophe %s/\%xe2\%x80\%x99/'/g | %s/\%xe2\%x80\%x98/'/g

" insert today's date 
command! InsertDate execute "normal! i" . strftime("%Y-%m-%d")
command! IDate execute "normal! i" . strftime("%e-%b-%Y")


command! MDInsertYoutube  execute "normal! i" . 
    \ '[![title](../images/YT_ZiCyDhoI1-0.jpg "caption")](https://www.youtube.com/watch ?v=ZiCyDhoI1-0)'


command! MDInsertHR  execute "normal! i" . 
    \ '<hr style="border-top: 2px solid yellow; width: 70%; height: 5px;">'
command! MDInsertPicture  execute "normal! i" . 
    \ '![Caption](../images/picture.jpg "Alt")'

command! MDInsertLinkNewtab  execute "normal! i" . 
    \ '<a href=" https://example.com " target="_blank" rel="noopener noreferrer">My Link</a>'
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











function! Fixnag()
    let l:save_search = @/
    let l:save_pos = getpos('.')

" to get superscript ctrl-K 7 S
" lower case s does subscript 
    keepjumps %s/\v ('|1|5|10|15|20|25|30|35|40) / /ge
    keepjumps %s/\v ('|1|5|10|15|20|25|30|35|40)$/ /ge
    keepjumps %s/\v (^'|1|5|10|15|20|25|30|35|40)/ /ge
    keepjumps %s/\v (\.'|1|5|10|15|20|25|30|35|40)/./ge
    keepjumps %s/\v ('¹|⁵|¹⁰|¹⁵|²⁵|²⁰|³⁰|³⁵|⁴⁰) / /ge
    keepjumps %s/\v ('|¹|⁵|¹⁰|¹⁵|²⁵|²⁰|³⁰|³⁵|⁴⁰)$/ /ge
    keepjumps %s/\v\.('|¹|⁵|¹⁰|¹⁵|²⁵|²⁰|³⁰|³⁵|⁴⁰)/./ge
    keepjumps %s/\v\,('|¹|⁵|¹⁰|¹⁵|²⁵|²⁰|³⁰|³⁵|⁴⁰)/,/ge
    keepjumps %s/\v^('|¹|⁵|¹⁰|¹⁵|²⁵|²⁰|³⁰|³⁵|⁴⁰)/ /ge

    let @/ = l:save_search
    call setpos('.', l:save_pos)
endfunction

" tie it to a single key
nnoremap <Leader>f :call Fixnag()<CR>

" -----------------------------------------------------------------------------
" Insert Frontmatter Command
" -----------------------------------------------------------------------------
"
" Creates a custom command `:IFront` to insert a YAML frontmatter stub at
" the top of the file.
"
" USAGE: In Normal mode, type `:IFront` and press Enter.

" Define a function to hold the logic. This is cleaner and more extensible.
function! InsertFrontMatter()
    " Get the file name without the extension (e.g., 'my-post' from 'my-post.md')
    " Use expand('%:t') if you want to include the extension
    let l:title_name = expand('%:t:r')

    " Create a list of lines for the frontmatter.
    " This makes it very easy to add or change lines later.
    let frontmatter_lines = [
    \   '---',
    \   'title: "' . l:title_name . '"',
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

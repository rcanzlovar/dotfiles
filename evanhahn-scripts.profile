
# https://evanhahn.com/scripts-i-wrote-that-i-use-all-the-time/
# convert HTML files in this directory to md files of the same name
alias html2mdthis="uv run --with html2text ~/Projects/blog-builder/scripts/html2md.py --input=. --output=."

# make a temporary directory, cd to it 
alias tempe="cd $(mktemp -d)"

# make a directory and cd into it 
function mkcd() {
    mkdir $1
    cd $1

}



# right now - date and time and a calendar 
alias rn="date && cal"

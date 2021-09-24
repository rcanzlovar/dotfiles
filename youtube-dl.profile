
alias youtube-audio-dl="youtube-dl --extract-audio --audio-format mp3 "

##    -x, --extract-audio              Convert video files to audio-only files
#    --audio-format FORMAT            Specify audio format: "best", "aac",
#    --audio-quality QUALITY

# download all the current documentaries from r/documentaries
alias getdocumentaries='cd ~/Videos/documentaries;curl -s -H "User-Agent: cli:bash:v0.0.0"   https://www.reddit.com/r/Documentaries/.json   | jq -r '.data.children[].data.url' | while read link; do youtube-dl -o "%(title)s.%(ext)s\" --download-archive r.docs.`date "+%s"`.log $link; done'
alias getfullmovies='cd ~/Videos/FullMovies;curl -s -H "User-Agent: cli:bash:v0.0.0"   https://www.reddit.com/r/fullmoviesonyoutube/.json   | jq -r '.data.children[].data.url' | while read link; do youtube-dl -o "%(title)s.%(ext)s" --download-archive r.docs.`date "+%s"`.log $link; done'
alias getdocs='cd ~/Videos/documentaries;curl -s -H "User-Agent: cli:bash:v0.0.0"   https://www.reddit.com/r/documentaries/.json   | jq -r '.data.children[].data.url' | while read link; do youtube-dl -o "%(title)s.%(ext)s" --download-archive r.docs.`date "+%s"`.log $link; done'
alias getmtv='cd ~/Videos/mealtimevideos;curl -s -H "User-Agent: cli:bash:v0.0.0"   https://www.reddit.com/r/mealtimevideos/.json   | jq -r '.data.children[].data.url' | while read link; do youtube-dl -o "%(title)s.%(ext)s" --download-archive r.docs.`date "+%s"`.log $link; done'


#get JSON info about a video
#wget https://www.youtube.com/oembed?url=http://www.youtube.com/watch?format=json&v=sGofo7dwisY

listen-to-yt() { if [[ -z "$1" ]]; then echo "Enter a search string!"; else mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)"; fi }

alias ytmovie=" youtube-dl  --format bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best "


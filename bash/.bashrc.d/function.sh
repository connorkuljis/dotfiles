# ~/.bashrc.d/function.sh
function reset_clock() {
    sudo hwclock -s
}

# https://yazi-rs.github.io/docs/quick-start/
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function ss() {
    if [[ -f ~/.bashrc ]]; then
        echo "Sourcing ~/.bashrc..."
        source ~/.bashrc
        echo "Finished sourcing ~/.bashrc"
    else
        echo "~/.bashrc not found!"
    fi
}

function dl_audio() {
    # Assign arguments to variables for clarity
    local audio_format="mp3"
    local url="$1"

    # Download audio using yt-dlp
    yt-dlp -P ~/Music/ \
        -x \
		--ignore-config \
        --audio-format "$audio_format" \
		--no-playlist \
        --embed-thumbnail \
        --embed-chapters \
        --embed-metadata \
		--restrict-filenames \
        "$url"
}

function dl_video() {
    # Check if exactly 2 arguments are provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: dl_video <format> <url>"
        return 1
    fi

    yt-dlp -P ~/Videos/ \
        --format bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best \
		--no-playlist \
        --embed-thumbnail \
        --embed-chapters \
        --embed-metadata \
		--output "%(uploader)s/%(upload_date>%Y-%m-%d)s_%(title)s.%(ext)s" \
		--restrict-filenames \
		$1
}

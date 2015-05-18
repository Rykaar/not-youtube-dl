#compdef youtube-dl

__youtube_dl() {
    local curcontext="$curcontext" fileopts diropts cur prev
    typeset -A opt_args
    fileopts="--download-archive|-a|--batch-file|--load-info|--cookies"
    diropts="--cache-dir"
    cur=$words[CURRENT]
    case $cur in
        :)
            _arguments '*: :(::ytfavorites ::ytrecommended ::ytsubscriptions ::ytwatchlater ::ythistory)'
        ;;
        *)
            prev=$words[CURRENT-1]
            if [[ ${prev} =~ ${fileopts} ]]; then
                _path_files
            elif [[ ${prev} =~ ${diropts} ]]; then
                _path_files -/
            elif [[ ${prev} == "--recode-video" ]]; then
                _arguments '*: :(mp4 flv ogg webm mkv)'
            else
                _arguments '*: :(--help --version --update --ignore-errors --abort-on-error --dump-user-agent --list-extractors --extractor-descriptions --default-search --ignore-config --flat-playlist --no-color --proxy --socket-timeout --source-address --force-ipv4 --force-ipv6 --cn-verification-proxy --playlist-start --playlist-end --playlist-items --match-title --reject-title --max-downloads --min-filesize --max-filesize --date --datebefore --dateafter --min-views --max-views --match-filter --no-playlist --yes-playlist --age-limit --download-archive --include-ads --rate-limit --retries --buffer-size --no-resize-buffer --test --playlist-reverse --xattr-set-filesize --hls-prefer-native --external-downloader --external-downloader-args --batch-file --id --output --autonumber-size --restrict-filenames --auto-number --title --literal --no-overwrites --continue --no-continue --no-part --no-mtime --write-description --write-info-json --write-annotations --load-info --cookies --cache-dir --no-cache-dir --rm-cache-dir --write-thumbnail --write-all-thumbnails --list-thumbnails --quiet --no-warnings --simulate --skip-download --get-url --get-title --get-id --get-thumbnail --get-description --get-duration --get-filename --get-format --dump-json --dump-single-json --print-json --newline --no-progress --console-title --verbose --dump-pages --write-pages --youtube-print-sig-code --print-traffic --call-home --no-call-home --encoding --no-check-certificate --prefer-insecure --user-agent --referer --add-header --bidi-workaround --sleep-interval --format --all-formats --prefer-free-formats --list-formats --youtube-include-dash-manifest --youtube-skip-dash-manifest --merge-output-format --write-sub --write-auto-sub --all-subs --list-subs --sub-format --sub-lang --username --password --twofactor --netrc --video-password --extract-audio --audio-format --audio-quality --recode-video --keep-video --no-post-overwrites --embed-subs --embed-thumbnail --add-metadata --metadata-from-title --xattrs --fixup --prefer-avconv --prefer-ffmpeg --ffmpeg-location --exec --convert-subtitles)'
            fi
        ;;
    esac
}

__youtube_dl
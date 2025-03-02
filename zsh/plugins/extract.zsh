#! /bin/zsh

extract() {
    local remove_archive
    local success
    local extract_dir

    if (( $# == 0 )); then
        echo \
"Usage: extract [-option] [file ...]
Options:
    -r, --remove    Remove archive after unpacking."
    fi

    remove_archive=1
    if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
        remove_archive=0
        shift
    fi

    while (( $# > 0 )); do
        if [[ ! -f "$1" ]]; then
            echo "extract: '$1' is not a valid file" >&2
            shift
            continue
        fi

        success=0
        extract_dir="${1:t:r}"
        case "${1:l}" in
            (*.tar.gz|*.tgz) tar zxvf "$1" ;;
            (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
            (*.tar.xz|*.txz)
                tar --xz --help &> /dev/null \
                && tar --xz -xvf "$1" \
                || xzcat "$1" | tar xvf - ;;
            (*.tar.zma|*.tlz)
                tar --lzma --help &> /dev/null \
                && tar --lzma -xvf "$1" \
                || lzcat "$1" | tar xvf - ;;
            (*.tar.zst|*.tzst)
                tar --zstd --help &> /dev/null \
                && tar --zstd -xvf "$1" \
                || zstdcat "$1" | tar xvf - ;;
            (*.tar) tar xvf "$1" ;;
            (*.tar.lz4) lz4 -c -d "$1" | tar xvf - ;;
            (*.gz) gunzip -k "$1" ;;
            (*.bz2) bunzip2 "$1" ;;
            (*.xz) unxz "$1" ;;
            (*.lz4) lz4 -d "$1" ;;
            (*.lzma) unlzma "$1" ;;
            (*.z) uncompress "$1" ;;
            (*.zip|*.war|*.jar|*.sublime-package|*.ipa|*.ipsw|*.xpi|*.apk|*.aar|*.whl) unzip "$1" -d $extract_dir ;;
            (*.rar) unrar x -ad "$1" ;;
            (*.rpm) mkdir "$extract_dir" && cd "$extract_dir" && rpm2cpio "../$1" | cpio --quiet -id && cd .. ;;
            (*.7z) 7za x "$1" ;;
            (*.deb)
                mkdir -p "$extract_dir/control"
                mkdir -p "$extract_dir/data"
                cd "$extract_dir"; ar vx "../${1}" > /dev/null
                cd control; tar xzvf ../control.tar.gz
                cd ../data; extract ../data.tar.*
                cd ..; rm *.tar.* debian-binary
                cd ..
            ;;
            (*.zst) unzstd "$1" ;;
            (*)
                echo "extract: '$1' cannot be extracted" >&2
                success=1
            ;;
        esac

        (( success = $success > 0 ? $success : $? ))
        (( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
        shift
    done
}

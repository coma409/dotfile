#!/bin/sh

batorcat() {
	file="$1"
	shift
	if command -v bat > /dev/null 2>&1
	then
		bat --color=always --style=plain --pager=never "$file" "$@"
	else
		cat "$file"
	fi
}

glowormdcat() {
	file="$1"
	shift
	if command -v glow > /dev/null 2>&1
	then
		glow "$file"
	else
		mdcat "$file"
	fi
}

case "$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')" in
	*.jpg|*.jpeg|*.png|*.gif|*.bmp|*.ico|*.svg|*.tiff)
		chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
		exit 1
		;;
	*.tgz|*.tar.gz) tar tzf "$1" ;;
	*.tar.bz2|*.tbz2) tar tjf "$1" ;;
	*.tar.txz|*.txz) xz --list "$1" ;;
	*.tar) tar tf "$1" ;;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1" ;;
	*.rar) unrar l "$1" ;;
	*.md) glowormdcat "$1";;
	*.7z) 7z l "$1" ;;
	*.[1-8]) man "$1" | col -b ;;
	*.o) nm "$1";;
	*.torrent) transmission-show "$1" ;;
	*.iso) iso-info --no-header -l "$1" ;;
	*.odt|*.ods|*.odp|*.sxw) odt2txt "$1" ;;
	*.doc) catdoc "$1" ;;
	*.docx) docx2txt "$1" ;;
	*.xml|*.html) w3m -dump "$1";;
	*.xls|*.xlsx)
		ssconvert --export-type=Gnumeric_stf:stf_csv "$1" "fd://1" | batorcat --language=csv
		;;
	*.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.mka)
		exiftool "$1"
		;;
	*.ino)
		batorcat --language=cpp "$1"
		;;
	*)
		batorcat "$1"
		;;
esac

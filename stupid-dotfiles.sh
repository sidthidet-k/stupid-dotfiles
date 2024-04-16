#!/bin/bash

IGNORE_CONFIG_FILE=".stupid-dotfiles-ignore"
IGNORE_FILE_LIST=(
	"$IGNORE_CONFIG_FILE"
	"${0#./}"
	".git/*"
	".gitignore"
	"README.md"
)

if [ ! -f "$IGNORE_CONFIG_FILE" ]; then
	echo 1>&2 "$IGNORE_CONFIG_FILE: no such file"
	exit 2
fi

IGNORE_FILE_LIST+=($(< $IGNORE_CONFIG_FILE))

exclude_file_option=()

for ignore_file in "${IGNORE_FILE_LIST[@]}"; do
	exclude_file_option+=("!" "-path" "./$ignore_file")
done

file_list=($(find . -type f "${exclude_file_option[@]}" -exec echo "{}" \;))

for file in "${file_list[@]}"; do
	file="${file#./}"
	directory="$(dirname $file)"
	[ ! -e "$HOME/$directory" ] && mkdir -pv "$HOME/$directory"
	[ ! -e "$HOME/$file" ] && ln -sv $(readlink -f "$file") "$HOME/$file"
done
exit 0


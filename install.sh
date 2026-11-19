#!/usr/bin/env bash


set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

sudo pacman -S --needed --noconfirm \
	waybar \
	alacritty \
	fuzzel \
	ttf-jetbrains-mono-nerd \
	swaybg \
	grim \
	slurp

BACKUP_DIR="$HOME/.config_backup_$(date +%d%m%Y_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in sway waybar alacritty fuzzel; do
	if [ -d "$HOME/.config/$dir" ]; then
		cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
	fi
done

mkdir -p "$HOME/.config"
cp -r .config/* "$HOME/.config"

echo "done!"

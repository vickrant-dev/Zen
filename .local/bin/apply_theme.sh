#!/usr/bin/env bash
set -euo pipefail

# Check for theme name
if [ $# -ne 1 ]; then
    echo "Usage: $0 <theme-name>"
    exit 1
fi

THEME_NAME="$1"
THEME_FILE="$HOME/.config/themes/${THEME_NAME}.conf"

if [ ! -f "$THEME_FILE" ]; then
    echo "Theme not found: $THEME_FILE"
    exit 1
fi

# Source the theme to get variables
source "$THEME_FILE"

# Convert hex colors to RGB for Hyprland
hex_to_rgb() {
    local hex="$1"
    hex="${hex#\#}"
    r=$((16#${hex:0:2}))
    g=$((16#${hex:2:2}))
    b=$((16#${hex:4:2}))
    echo "rgb($r,$g,$b)"
}
ACCENT_RGB=$(hex_to_rgb "$ACCENT")
ACCENT2_RGB=$(hex_to_rgb "$ACCENT2")
BLACK_RGB=$(hex_to_rgb "$BLACK")
BLACK_RGBA="rgba(${BLACK_RGB:4:-1},0.93)"

# Export variables so envsubst can use them
export BG FG ACCENT ACCENT2 RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE TRANSPARENT_BG GTK_THEME ICON_THEME CURSOR_THEME QT_STYLE ACCENT_RGB ACCENT2_RGB BLACK_RGB BLACK_RGBA

# Generate configs from templates
TEMPLATE_DIR="$HOME/.config/templates"

# Hyprland theme
envsubst < "$TEMPLATE_DIR/hypr-theme.conf.template" > "$HOME/.config/hypr/config/theme.conf"

# Waybar style
envsubst < "$TEMPLATE_DIR/waybar-style.css.template" > "$HOME/.config/waybar/style.css"

# Rofi config
envsubst < "$TEMPLATE_DIR/rofi-config.rasi.template" > "$HOME/.config/rofi/config.rasi"

# Kitty config
envsubst < "$TEMPLATE_DIR/kitty.conf.template" > "$HOME/.config/kitty/kitty.conf"

# Mako config
envsubst < "$TEMPLATE_DIR/mako-config.template" > "$HOME/.config/mako/config"

# Neovim theme
envsubst < "$TEMPLATE_DIR/nvim-theme.lua.template" > "$HOME/.config/nvim/lua/theme.lua"

# Apply if a valid profile was found
if [ -n "$FIREFOX_PROFILE_DIR" ] && [ -d "$FIREFOX_PROFILE_DIR" ]; then
  mkdir -p "$FIREFOX_PROFILE_DIR/chrome"
  envsubst < "$TEMPLATE_DIR/firefox-userChrome.css.template" > "$FIREFOX_PROFILE_DIR/chrome/userChrome.css"
  echo "Firefox theme applied to $FIREFOX_PROFILE_DIR"
else
  echo "Firefox profile not found; skipping."
fi


# Reload components
echo "Reloading Hyprland..."
hyprctl reload

echo "Restarting Waybar..."
pkill waybar || true
waybar &

echo "Restarting Mako..."
pkill mako || true
mako &

echo "Reloading Kitty config..."
pkill -USR1 kitty || true

# Apply GTK theme and icons
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
gsettings set org.gnome.desktop.interface font-name "JetBrains Mono 11"

# Apply Qt style (if qt5ct/qt6ct are used)
if [ -f "$HOME/.config/qt5ct/qt5ct.conf" ]; then
    sed -i "s/^style=.*/style=$QT_STYLE/" "$HOME/.config/qt5ct/qt5ct.conf"
fi
if [ -f "$HOME/.config/qt6ct/qt6ct.conf" ]; then
    sed -i "s/^style=.*/style=$QT_STYLE/" "$HOME/.config/qt6ct/qt6ct.conf"
fi

echo "Theme applied: $THEME_NAME"


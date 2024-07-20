# macOS dotfiles

---

Welcome to my macOS configuration files, this were very inspired by this guy -> [FelixKratz](https://github.com/FelixKratz/dotfiles)

## SketchyBar Setup

### Manual Install Steps (for now)

This is actually really similar to the _FelixKratz_ config so, most of commands are the same

- Dependencies([sf-symbols](https://developer.apple.com/sf-symbols/), [jq](https://jqlang.github.io/jq/), [github-cli](https://cli.github.com/), [switchaudio-osx](https://github.com/deweller/switchaudio-osx), [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font)):

```bash
brew install --cask sf-symbols
brew install jq
brew install gh
brew install switchaudio-osx
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```

- (optional) `gh auth login` for GitHub notifications
- (optional) If you don't use yabai you can safely remove the `yabai` item from `items/yabai.sh` or `sketchybarrc`
- (optional; needed for yabai window state) yabai event:

```bash
yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"
```

- (optional; needed for yabai window state) skhd shortcuts should trigger the sketchybar event, e.g.:

```bash
lalt - space : yabai -m window --toggle float; sketchybar --trigger window_focus
shift + lalt - f : yabai -m window --toggle zoom-fullscreen; sketchybar --trigger window_focus
lalt - f : yabai -m window --toggle zoom-parent; sketchybar --trigger window_focus
```

- (optional) update outdated packages after running brew commands (add to `.zshrc`):

```bash
function brew() {
  command brew "$@"

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}
```

NOTE: The `helper` C program is included here only to show off this specific
functionality of sketchybar and is not needed generally. It provides the data
for the cpu graph. Using a `mach_helper` provides a _much_
lower overhead solution for performance sensitive tasks, since the `helper`
talks directly to sketchybar via kernel level messages.
For most tasks (including those listed above) this difference in performance

NOTE 2: Don't forget make all .sh files from plugins executable like said here [Setup Plugins](https://felixkratz.github.io/SketchyBar/setup#plugins)

```bash
chmod -x *.sh
```

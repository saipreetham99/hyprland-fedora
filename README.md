# Hyprland Configuration README

This README provides an overview of the features, keybindings, and animation changes implemented in this Hyprland configuration.

## Features

This configuration is designed to be both aesthetically pleasing and highly functional. It uses a modular approach, with a main `hyprland.conf` file that sources various other configuration files. This makes it easy to customize and manage your settings.

Some of the key features include:

- **Two Layouts:** The configuration supports both `Dwindle` and `Master` layouts, which can be toggled with a keybinding.
- **Customizable User Settings:** The `UserConfigs` directory allows you to override and extend the default settings without modifying the core configuration files. This makes it easy to update the configuration without losing your personalizations.
- **Extensive Keybindings:** A comprehensive set of keybindings is provided for managing windows, workspaces, and various system functions.
- **Custom Animations:** The configuration includes a set of custom animations for a smooth and visually appealing user experience.
- **Various Scripts:** The configuration includes a variety of scripts to enhance functionality, such as a screenshot tool, a volume control script, and a power menu.

## Keybindings

The following are some of the most important keybindings in this configuration. For a complete list, please refer to the `configs/Keybinds.conf` and `UserConfigs/UserKeybinds.conf` files.

| Keybinding                       | Description                                       |
| -------------------------------- | ------------------------------------------------- |
| `SUPER` + `Q`                    | Close the active window                           |
| `SUPER` + `SHIFT` + `Q`          | Kill the active process                           |
| `CTRL` + `ALT` + `L`             | Lock the screen                                   |
| `CTRL` + `ALT` + `P`             | Open the power menu                               |
| `SUPER` + `N`                    | Open the notification panel                       |
| `SUPER` + `SHIFT` + `E`          | Open the settings menu                            |
| `SUPER` + `Return`               | Open a terminal                                   |
| `SUPER` + `E`                    | Open the file manager                             |
| `SUPER` + `B`                    | Open the web browser                              |
| `SUPER` + `Print`                | Take a screenshot                                 |
| `SUPER` + `SHIFT` + `Print`      | Take a screenshot of a selected area              |
| `SUPER` + `CTRL` + `Print`       | Take a screenshot with a 5-second delay           |
| `SUPER` + `SHIFT` + `S`          | Take a screenshot with Swappy                     |
| `SUPER` + `Arrow Keys`           | Move focus between windows                        |
| `SUPER` + `SHIFT` + `Arrow Keys` | Resize windows                                    |
| `SUPER` + `CTRL` + `Arrow Keys`  | Move windows                                      |
| `SUPER` + `ALT` + `Arrow Keys`   | Swap windows                                      |
| `SUPER` + `[0-9]`                | Switch to the specified workspace                 |
| `SUPER` + `SHIFT` + `[0-9]`      | Move the active window to the specified workspace |
| `SUPER` + `G`                    | Toggle window grouping                            |
| `SUPER` + `SPACE`                | Toggle floating mode for the active window        |
| `ALT`+`SPACE`                    | Rofi menu                                         |

## Animations

This configuration uses a custom animation setup to provide a smooth and visually appealing user experience. The animations are defined in the `UserConfigs/UserAnimations.conf` file.

The following animation styles are used:

- **Windows:** Windows open and close with a "pop-in" effect.
- **Workspaces:** Workspaces slide in and out with a "slidefadevert" effect.
- **Layers:** Layers use a "popin" animation.

These animations can be toggled on and off with the `SUPER` + `SHIFT` + `G` keybinding.

## System Scripts

This configuration includes a variety of scripts to enhance functionality. These scripts are located in the `scripts` directory and are organized into the following categories:

- **System & Hardware:** Scripts for managing system-level settings like brightness, volume, and airplane mode.
- **Appearance & Theming:** Scripts for managing themes, wallpapers, and other visual elements.
- **Utilities & Tools:** Scripts for screenshots, color picking, and other useful tools.
- **Application Launchers:** Scripts for launching applications and menus.

## Gestures

This configuration uses `libinput-gestures` to provide touchpad gestures. The following gestures are enabled by default:

| Gesture       | Action                         |
| ------------- | ------------------------------ |
| `swipe up`    | Move to the next workspace     |
| `swipe down`  | Move to the previous workspace |
| `swipe left`  | Go forward in web browser      |
| `swipe right` | Go back in web browser         |
| `pinch in`    | Open/close overview            |
| `pinch out`   | Open/close overview            |

## Installation

To use this configuration, you will need to have Hyprland installed on your system. You will also need to install `libinput-gestures` to enable touchpad gestures.

### Installing `libinput-gestures`

**Arch Linux:**

```bash
sudo pacman -S libinput-gestures wmctrl xdotool
```

**Fedora:**

```bash
sudo dnf copr enable elxreno/libinput-gestures
sudo dnf install libinput-gestures
```

After installing `libinput-gestures`, you will need to add your user to the `input` group:

```bash
sudo usermod -aG input $(whoami)
```

Finally, you will need to reboot your system for the changes to take effect.

### Configuring Hyprland

Once you have installed the necessary dependencies, you can clone this repository to your `~/.config/hypr` directory:

```bash
git clone https://github.com/your-username/your-repo-name ~/.config/hypr
```

After cloning the repository, you will need to restart Hyprland for the changes to take effect.

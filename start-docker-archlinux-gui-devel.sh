#!/usr/bin/env bash

# Setup Wayland
# -------------
#
# Docker args:
#     -e XDG_RUNTIME_DIR=/tmp \
#     -e WAYLAND_DISPLAY=${WAYLAND_DISPLAY} \
#     -v ${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}:/tmp/${WAYLAND_DISPLAY} \
#
# Refer:
# - https://github.com/mviereck/x11docker/wiki/How-to-provide-Wayland-socket-to-docker-container

# Setup GPU
# ---------
#
# Docker args:
#     --device /dev/dri \
#
# Refer:
# - https://github.com/mviereck/x11docker/wiki/Hardware-acceleration

# Setup PipeWire
# --------------
#
# Docker args:
#    -v ${XDG_RUNTIME_DIR}/pipewire-0:/tmp/pipewire-0 \
#
# Refer:
# - https://github.com/mviereck/x11docker/wiki/Container-sound:-ALSA-or-Pulseaudio
# - https://stackoverflow.com/questions/28985714/run-apps-using-audio-in-a-docker-container/75775875#75775875

# Setup X11 (optional)
# --------------------
#
# Docker args:
#     -v ${X11SOCKET_FOLDER}:${X11SOCKET_FOLDER} \
#     -v ${X11AUTHORITY_FILE}:${X11AUTHORITY_FILE} \
#     -e X11AUTHORITY_FILEORITY=${X11AUTHORITY_FILE} \
#     -e DISPLAY=${DISPLAY}
#
# Refer:
# - https://github.com/mviereck/x11docker/wiki/Short-setups-to-provide-X-display-to-container
# - https://github.com/mviereck/x11docker/wiki/X-authentication-with-cookies-and-xhost-(%22No-protocol-specified%22-error)
# - https://stackoverflow.com/questions/72081697/how-can-i-run-firefox-from-within-a-docker-container

export X11SOCKET_FOLDER=/tmp/.X11-unix

# Create XAuthority file for container
export X11AUTHORITY_FILE=/tmp/.docker.xauth
touch ${X11AUTHORITY_FILE}

DISPLAY_CANONICAL=$(echo $DISPLAY | sed s/localhost//)
if [ $DISPLAY_CANONICAL != $DISPLAY ]
then
    export DISPLAY=$DISPLAY_CANONICAL
fi

# Change to allow any host to connect to this X server
# it's slightly easier to use XAuthority file then
# command `xhost +SI:localuser:$(id -un)`
xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | uniq | xauth -f ${X11AUTHORITY_FILE} nmerge -

# Application data folders
# ------------------------
GUI_APP_DATA_FOLDER="${HOME}/docker-gui-app-data"
mkdir -p ${GUI_APP_DATA_FOLDER}/.local
mkdir -p ${GUI_APP_DATA_FOLDER}/.config
mkdir -p ${GUI_APP_DATA_FOLDER}/.cache
mkdir -p ${GUI_APP_DATA_FOLDER}/.rustup
mkdir -p ${GUI_APP_DATA_FOLDER}/.cargo
mkdir -p ${GUI_APP_DATA_FOLDER}/.m2
mkdir -p ${GUI_APP_DATA_FOLDER}/go

# Setup VSCode remote devel
# -------------------------
# Mapping `~/.ssh`, `~./vscode-server` to host somewhere
mkdir -p ${GUI_APP_DATA_FOLDER}/.ssh
mkdir -p ${GUI_APP_DATA_FOLDER}/.vscode-server

# Share folders
# -------------
# - ~/projects
# - ~/libraries

docker run \
  -it \
  --rm \
  --mount type=bind,source="${HOME}/Downloads",target="/root/Downloads" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.ssh",target="/root/.ssh" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.vscode-server",target="/root/.vscode-server" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.local",target="/root/.local" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.config",target="/root/.config" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.cache",target="/root/.cache" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.rustup",target="/root/.rustup" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.cargo",target="/root/.cargo" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/.m2",target="/root/.m2" \
  --mount type=bind,source="${GUI_APP_DATA_FOLDER}/go",target="/root/go" \
  --mount type=bind,source="${HOME}/projects",target="/root/projects" \
  --mount type=bind,source="${HOME}/libraries",target="/root/libraries" \
  --mount type=bind,source="${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}",target="/tmp/$WAYLAND_DISPLAY" \
  -e XDG_RUNTIME_DIR=/tmp \
  -e WAYLAND_DISPLAY=${WAYLAND_DISPLAY} \
  -e XDG_SESSION_TYPE=wayland \
  -e GDK_BACKEND=wayland \
  -e QT_QPA_PLATFORM=wayland \
  -e SDL_VIDEODRIVER=wayland \
  -e GTK_IM_MODULE=fcitx \
  -e XMODIFIERS=@im=fcitx \
  -e QT_IM_MODULE=fcitx \
  --mount type=bind,source="${X11SOCKET_FOLDER}",target="${X11SOCKET_FOLDER}" \
  --mount type=bind,source="${X11AUTHORITY_FILE}",target="${X11AUTHORITY_FILE}" \
  -e XAUTHORITY=${X11AUTHORITY_FILE} \
  -e DISPLAY=${DISPLAY} \
  --mount type=bind,source="${XDG_RUNTIME_DIR}/pipewire-0",target="/tmp/pipewire-0" \
  --device /dev/dri \
  --device /dev/snd \
  --network host \
  --cap-add=NET_RAW \
  archlinux-gui-devel:1.1.0

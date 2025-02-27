# GUI applications development environment in a container

This repository contains Dockerfiles that build two Docker images for GUI applications development, along with launch scripts to start these images.

## archlinux-gui-devel

**Out-of-the-box development environment for GUI application development**

This image includes common programming languages such as C/C++, Rust, Go, Java, Python and Nodejs. It also contains corresponding tools like GNU make, cmake, GDB, Rustup, npm, Maven, and pipx. making it a ready-to-use development environment.

This image is built on top of [archlinux-gui](https://hub.docker.com/r/hemashushu/archlinux-gui), allowing you to develop and debug GUI applications within container. Just use the launch script [start-docker-archlinux-gui-devel.sh](https://github.com/hemashushu/docker-archlinux-gui-devel/blob/main/start-docker-archlinux-gui-devel.sh) to start the container.

> But why develop GUI applications in a container? To avoid cluttering your host system :D

> For detailed principle on running GUI applications in containers, please refer to [How to run GUI applications directly in containers](https://github.com/hemashushu/docker-archlinux-gui).

This container also starts an SSH server on port `3333`. The initial password for the root user is `123456`. You can connect to this container via [VSCode's Remote development over SSH](https://code.visualstudio.com/docs/remote/ssh-tutorial), allowing you to use your familiar tools for development.

## archlinux-gui-vscode-oss

**VSCode that can be launched directly in a container without installation**

This image adds the VSCode application on top of the previous image.

Installing VSCode can be challenging on some Linux distributions. If you encounter such difficulties, consider using this image. As long as your system has Docker or Podman (recommended) installed, you can start the container using the [start-docker-archlinux-gui-vscode-oss.sh](https://github.com/hemashushu/docker-archlinux-gui-devel/blob/main/start-docker-archlinux-gui-vscode-oss.sh) script. This VSCode can also be used for developing and debugging GUI applications, and it does not require any software installation or configuration on the host system.

## Images

- https://hub.docker.com/r/hemashushu/archlinux-gui
- https://hub.docker.com/r/hemashushu/archlinux-gui-firefox
- https://hub.docker.com/r/hemashushu/archlinux-gui-mpv
- https://hub.docker.com/r/hemashushu/archlinux-gui-devel
- https://hub.docker.com/r/hemashushu/archlinux-gui-vscode-oss

## Repositories

- https://github.com/hemashushu/docker-archlinux-gui
- https://github.com/hemashushu/docker-archlinux-gui-devel
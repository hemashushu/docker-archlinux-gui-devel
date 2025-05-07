# GUI Applications Development Environment in a Container

This repository contains Dockerfiles that build two Docker images for GUI application development, along with launch scripts to start these images.

## archlinux-gui-devel

**Out-of-the-box development environment for GUI application development**

This image includes common programming languages such as C/C++, Rust, Go, Java, Python, and Node.js. It also contains corresponding tools like GNU Make, CMake, GDB, Rustup, npm, Maven, and pipx, making it a ready-to-use development environment.

This image is built on top of [archlinux-gui](https://hub.docker.com/r/hemashushu/archlinux-gui), allowing you to develop and debug GUI applications within the container. Just use the launch script [start-docker-archlinux-gui-devel.sh](https://github.com/hemashushu/docker-archlinux-gui-devel/blob/main/start-docker-archlinux-gui-devel.sh) to start the container.

> Why develop GUI applications in a container? To avoid cluttering your host system! :D

> For detailed principles on running GUI applications in containers, please refer to [How to run GUI applications directly in containers](https://github.com/hemashushu/docker-archlinux-gui).

This container also starts an SSH server on port `3333`. The initial password for the root user is `123456`. You can connect to this container via [VSCode's Remote Development over SSH](https://code.visualstudio.com/docs/remote/ssh-tutorial), allowing you to use your familiar tools for development.

## archlinux-gui-vscode-oss

**VSCode that can be launched directly in a container without installation**

This image adds the VSCode application on top of the previous image.

Installing VSCode can be challenging on some Linux distributions. If you encounter such difficulties, consider using this image. As long as your system has Docker or Podman (recommended) installed, you can start the container using the [start-docker-archlinux-gui-vscode-oss.sh](https://github.com/hemashushu/docker-archlinux-gui-devel/blob/main/start-docker-archlinux-gui-vscode-oss.sh) script. This VSCode instance can also be used for developing and debugging GUI applications, and it does not require any software installation or configuration on the host system.

## Images

- [archlinux-gui](https://hub.docker.com/r/hemashushu/archlinux-gui)
- [archlinux-gui-firefox](https://hub.docker.com/r/hemashushu/archlinux-gui-firefox)
- [archlinux-gui-mpv](https://hub.docker.com/r/hemashushu/archlinux-gui-mpv)
- [archlinux-gui-devel](https://hub.docker.com/r/hemashushu/archlinux-gui-devel)
- [archlinux-gui-vscode-oss](https://hub.docker.com/r/hemashushu/archlinux-gui-vscode-oss)

## Repositories

- [docker-archlinux-gui](https://github.com/hemashushu/docker-archlinux-gui)
- [docker-archlinux-gui-devel](https://github.com/hemashushu/docker-archlinux-gui-devel)
- [docker-ubuntu-gui-devel](https://github.com/hemashushu/docker-ubuntu-gui-devel)

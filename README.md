# GUI Applications Development Environment in a Container

This repository contains Dockerfiles that build two Docker images for GUI application development, along with launch scripts to start these images.

## archlinux-gui-devel

**A ready-to-use development environment for GUI application development**

This image includes popular programming languages such as C/C++, Rust, Go, Java, Python, and Node.js, along with essential tools like GNU Make, CMake, GDB, Rustup, npm, Maven, and pipx. It provides a comprehensive environment for GUI application development.

Built on top of [archlinux-gui](https://hub.docker.com/r/hemashushu/archlinux-gui), this image allows you to develop and debug GUI applications directly within the container. Use the launch script [start-docker-archlinux-gui-devel.sh](https://github.com/hemashushu/docker-archlinux-gui-devel/blob/main/start-docker-archlinux-gui-devel.sh) to start the container effortlessly.

> Why develop GUI applications in a container? To keep your host system clean and organized! :D

> For detailed guidance on running GUI applications in containers, refer to [How to run GUI applications directly in containers](https://github.com/hemashushu/docker-archlinux-gui).

This container also starts an SSH server on port `3333`. The default password for the root user is `123456`. You can connect to this container using [VSCode's Remote Development over SSH](https://code.visualstudio.com/docs/remote/ssh-tutorial), enabling you to work with familiar tools for development.

## archlinux-gui-vscode

**Run VSCode directly in a container without installation**

This image extends the `archlinux-gui-devel` image by adding the VSCode application.

Installing VSCode can be challenging on certain Linux distributions (e.g., NixOS). With Docker or Podman (recommended) installed on your system, you can build the `archlinux-gui-vscode` image using the script `build-docker-image-archlinux-gui-vscode.sh` and run it with the script `start-docker-archlinux-gui-vscode.sh`. This approach eliminates the need for software installation or configuration on the host system.

## archlinux-gui-clion

**A demonstration image with CLion pre-installed**

This image builds upon the `archlinux-gui-devel` image by adding the CLion application. It serves as a demonstration, similar to the `archlinux-gui-vscode` image.

## Related Repositories

- [docker-archlinux-gui](https://github.com/hemashushu/docker-archlinux-gui)
- [docker-archlinux-gui-devel](https://github.com/hemashushu/docker-archlinux-gui-devel)
- [docker-ubuntu-gui-devel](https://github.com/hemashushu/docker-ubuntu-gui-devel)

## Available Images

It's recommended to build the images from the Dockerfiles in this repository since the size of the images is large. However, if you prefer to use pre-built images, you can find them on Docker Hub:

- [archlinux-gui](https://hub.docker.com/r/hemashushu/archlinux-gui)
- [archlinux-gui-firefox](https://hub.docker.com/r/hemashushu/archlinux-gui-firefox)
- [archlinux-gui-mpv](https://hub.docker.com/r/hemashushu/archlinux-gui-mpv)
- [archlinux-gui-devel](https://hub.docker.com/r/hemashushu/archlinux-gui-devel)
- [archlinux-gui-vscode-oss](https://hub.docker.com/r/hemashushu/archlinux-gui-vscode-oss)

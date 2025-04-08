FROM archlinux-gui:1.1.0

# Update repository and system.
RUN pacman -Syu --noconfirm

# Install base development tools.
RUN pacman -S base-devel --noconfirm

# Install common development tools.
RUN pacman -S ninja cmake musl clang lld valgrind gdb --noconfirm

# Install essential tools.
RUN pacman -S bash-completion wget vim git openssh --noconfirm

# Install common programming languages (modify as needed).
RUN pacman -S rustup go nodejs npm jdk-openjdk maven gradle python python-pipx --noconfirm

# Install TypeScript
RUN npm install -g typescript

# (Optional) Set Rustup local mirror.
RUN echo "export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup" >> /root/.bashrc && \
    echo "export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup" >> /root/.bashrc

# (Optional) Set Golang local mirror.
RUN echo "export GO111MODULE=on" >> /root/.bashrc && \
    echo "export GOPROXY=https://goproxy.cn,direct" >> /root/.bashrc

# (Optional) Install Rust toolchain.
# RUN source /root/.bashrc && rustup default stable

# (Optional) Install Rust additional targets.
# RUN source /root/.bashrc && rustup target install x86_64-unknown-linux-musl

# Set password for root user to "123456" for ssh remote login.
RUN echo 'root:123456' | chpasswd

# `sshd` needs this folder.
RUN mkdir /var/run/sshd

# Generate SSH server side key.
RUN ssh-keygen -A

# Enable root user remote login.
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Change SSH server port to 3333.
RUN sed -i 's/#Port 22/Port 3333/' /etc/ssh/sshd_config

# Expose port.
EXPOSE 3333

# Set $PATH and your favorite profile.
RUN echo 'export PATH=$PATH:/root/.local/bin:/root/.cargo/bin:/root/go/bin' >> /root/.bashrc && \
    echo 'alias ls="ls --color=auto"' >> /root/.bashrc

# Change the permission of XDG_RUNTIME_DIR.
RUN chmod 700 /tmp

# Change the work directory.
WORKDIR /root

# Start sshd and bash
CMD /usr/sbin/sshd; /usr/bin/bash

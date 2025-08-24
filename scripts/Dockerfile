FROM ubuntu:22.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \ 
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    file \
    gawk \
    gcc \
    git \
    iputils-ping \
    libacl1 \
    liblz4-tool \
    locales \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-subunit \
    socat \
    texinfo \
    unzip \
    wget \
    xz-utils \
    zstd \
    cmake \
    ninja-build \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Set up locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create a non-root user for bitbake
ARG USER=yocto
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USER} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set user context
USER ${USER}
WORKDIR /home/${USER}

# Environment variables for Yocto build (optional override)
ENV YOCTO_DIR=/home/${USER}

RUN chown -hR ${USER} ${YOCTO_DIR}

# WORKDIR /workspace
ENTRYPOINT ["/bin/bash"]


# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Avoid interactive dialogue from tzdata and other packages
ARG DEBIAN_FRONTEND=noninteractive

# Update and install the necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    gnupg \
    lsb-release \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (you can specify a version by replacing 'setup_16.x' with the version you want)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Zsh
RUN apt-get update && apt-get install -y zsh \
    && rm -rf /var/lib/apt/lists/*

# Install tmux
RUN apt-get update && apt-get install -y tmux \
    && rm -rf /var/lib/apt/lists/*

# Install Neovim 0.9+ (You might need to adjust this if the version in the repo is not 0.9+)
# For the latest version, consider downloading the AppImage from the Neovim releases page
RUN add-apt-repository ppa:neovim-ppa/unstable \
    && apt-get update \
    && apt-get install -y neovim \
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to Zsh
SHELL ["/bin/zsh", "-c"]

# Set the working directory
WORKDIR /workspace

# Start Zsh when the container launches
CMD ["zsh"]

FROM alpine:latest

# Install basic utilities and Neovim
RUN apk add --no-cache \
    bash \
    curl \
    git \
    neovim \
    ripgrep

# Set up Neovim configuration
# RUN mkdir -p /root/.config/nvim
# RUN git clone https://github.com/jocades/jvim.git /root/.config/nvim

# Set working directory
WORKDIR /root

# Set default command
CMD ["/bin/bash"]

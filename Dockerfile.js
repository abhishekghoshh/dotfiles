FROM abhishek1009/ubuntu:latest

# 1. Define Build Arguments
# We default to version 25, as requested.
ARG NODE_VERSION=25
# We use the NVM version from your script
ARG NVM_VERSION=v0.40.3

ENV DEBIAN_FRONTEND=noninteractive

# 2. Install NVM, Node, and Global Tools
# We must do this in a SINGLE RUN command. 
# Why? Because 'source nvm.sh' only works for the current shell session. 
# If we split this into multiple RUN commands, the next command won't remember nvm exists.
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash && \
    \
    # Load NVM (The line from your script)
    . "$HOME/.nvm/nvm.sh" && \
    \
    # Install Node.js
    nvm install ${NODE_VERSION} && \
    nvm alias default ${NODE_VERSION} && \
    nvm use default && \
    \
    # Install Global Packages (Yarn, pnpm, Vitest)
    npm install -g yarn pnpm vitest && \
    \
    # CRITICAL STEP: Symlink binaries to /usr/local/bin
    # This makes 'node', 'npm', etc. available globally without needing to source nvm.sh every time.
    # We use $(dirname $(nvm which current)) to find the path of the installed node bin.
    NODE_BIN=$(dirname $(nvm which current)) && \
    ln -s $NODE_BIN/node /usr/local/bin/node && \
    ln -s $NODE_BIN/npm /usr/local/bin/npm && \
    ln -s $NODE_BIN/npx /usr/local/bin/npx && \
    ln -s $NODE_BIN/yarn /usr/local/bin/yarn && \
    ln -s $NODE_BIN/pnpm /usr/local/bin/pnpm && \
    ln -s $NODE_BIN/vitest /usr/local/bin/vitest

# 3. Configure Environment (Optional but Recommended)
# Even with symlinks, it's good to let NVM manage the path in interactive shells (like zsh).
# The install script usually updates .bashrc/.zshrc, but we set NVM_DIR explicitly.
ENV NVM_DIR="/root/.nvm"

# Expose ports
EXPOSE 3000-4000
EXPOSE 8000-9000

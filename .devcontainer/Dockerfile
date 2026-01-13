FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory
WORKDIR /workspace

# Copy package files for dependency installation
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# The workspace will be mounted at /workspace, overwriting these files
# but node_modules will be preserved via volume mount

#!/bin/bash

# to make execurable
# chmod +x install_nodejs.sh

echo "- Install PNPM COREPACK packages --------------------------------------------------"

# curl -fsSL https://get.pnpm.io/install.sh | sh -
npm install --global corepack@latest
corepack enable pnpm
pnpm

# alias pnpm="corepack pnpm"
# alias pnpx="corepack pnpx"
# alias npm="corepack npm"
# alias npx="corepack npx"

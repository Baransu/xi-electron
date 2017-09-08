#!/usr/bin/env bash

# Stop execution on error.
set -e

# Check that we have the right tools for this job.
command -v git >/dev/null 2>&1 || { echo >&2 "git is required to build xi-editor! It was not found in \$PATH. Aborting."; exit 1; }
command -v cargo >/dev/null 2>&1 || { echo >&2 "cargo is required to build xi-editor! It was not found in \$PATH. Aborting."; exit 1; }

# Clone xi-editor repo (deleting old one if it exists).
rm -rf ./.xi-core
git clone https://github.com/google/xi-editor.git ./.xi-core

# Build xi-syntect-plugin
echo "Starting xi-syntect-plugin build"
cd ./.xi-core/rust/syntect-plugin
cargo build
cd ../../../

# Build xi-editor from source.
echo "Starting xi-core build"
cd ./.xi-core/rust
cargo build
cd ../../

# Clear old build
rm -rf ./src/xi-core
rm -rf ./src/xi-plugins
# Copy xi-core
cp -R ./.xi-core/rust/target/debug ./src/xi-core
# Copy plugins
mkdir ./src/xi-plugins
cp ./.xi-core/python/bracket_example.py ./src/xi-plugins/
cp ./.xi-core/python/shouty.py ./src/xi-plugins/
cp ./.xi-core/python/spellcheck.py ./src/xi-plugins/
cp ./.xi-core/rust/syntect-plugin/target/debug/xi-syntect-plugin ./src/xi-plugins/xi-syntect-plugin

echo "Build complete!"
echo "The xi-editor core was built and placed in src/xi-core"
echo "The xi-editor plugins were built and places in src/xi-plugins"

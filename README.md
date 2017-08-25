# Xi Electron
_A front-end for the xi-editor built with modern web technologies._

## Demo

![XiEditor](./demo/demo.png)

NOTE: This is still a WIP!

## Getting started

To build and run `xi-electron` you'll need to have [NodeJS](https://nodejs.org) installed (Node version 6 or greater) as well as Git.

To get started, simply run:

```bash
> git clone https://gitlab.com/callodacity/xi-electron
> cd xi-electron
> npm install   # or `yarn`
> npm run make  # or `yarn make`
```

The built app will be output to `xi-electron/out/`.

## Updating `xi-core`

The easiest way by far is to use the install script found in [`bin/install-core`](bin/install-core.sh). You will need to have Git, Rust and relevant build tools installed. This script will clone the latest version of `xi-core`, build it, and copy it into `xi-electron`.

---

In order to build it manually, follow these steps:

To update `xi-core`, you must build it and place it in `xi-electron/src/xi-core/`. You can do so by following these steps (taken from [the `xi-editor` repo](https://github.com/google/xi-editor#building-the-core)):

> You need [Xcode 8.2](https://developer.apple.com/xcode/) (only on Mac) and [Rust](https://www.rust-lang.org/) (version 1.13+ is recommended and supported). You should have `cargo` in your path. You'll also need cmake installed, to run the syntax highlighter. If you have homebrew, easiest to run `brew install cmake`. It is possible to build without cmake, but requires some editing of build scripts.

To build the core:

```bash
> git clone https://github.com/google/xi-editor
> cd xi-editor/rust
> cargo build
```

Then copy the contents of `xi-editor/rust/target/debug/**/*` to `xi-electron/src/xi-core` and rebuild `xi-electron`.

## Lastly

All credits for the [xi-editor](https://github.com/google/xi-editor) go to Raph Levien.

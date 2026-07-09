# Aetower Homebrew Tap

Install Aetower from the official Homebrew tap:

```sh
brew tap Aeptus/aetower
brew install --cask aetower
```

The cask installs the same signed and notarized Aetower app bundle published at
https://aetower.dev/ and links the bundled `aetower` CLI into Homebrew's
`bin` directory.

After installation, launch Aetower and smoke-check:

```sh
aetower top
aetower storage
aetower repos
```

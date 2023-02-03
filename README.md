# cpc-daemon

This repository contains a nix flake for the [SiliconLabs Co-Processor Communication Daemon](https://github.com/SiliconLabs/cpc-daemon) and a justfile with a few conveniences.

```
Available recipes:
    build                      # Build the cpcd derivation or fetch a store path
    check *options             # Check whether the flake evaluates and run its tests
    cross target='raspberryPi' # Build the cpcd derivation for some target or fetch a store path
    develop                    # Enter development shell
    fmt                        # Format the nix files
    help                       # Run cpcd --help
    run                        # Run cpcd
    show *options              # Show the outputs provided by a flake
```

## Development environment using nix-direnv

Use [`direnv`](https://direnv.net/) combined with [`nix-direnv`](https://github.com/nix-community/nix-direnv) to automatically augment your shell when you navigate to the project directory.

Create `.direnv.rc`

```
───────┬───────────────────────────────────────────────────────────────────
       │ File: .direnv.rc
───────┼───────────────────────────────────────────────────────────────────
   1   │ if [ -f $HOME/.nix-profile/share/nix-direnv/direnvrc ]; then
   2   │     source $HOME/.nix-profile/share/nix-direnv/direnvrc
   3   │ fi
───────┴───────────────────────────────────────────────────────────────────
```

and give `direnv` permission to load the `.envrc` present in the project directory.

```
> direnv allow
```

_default:
	@just --list

_nix command:
	@nix --experimental-features 'nix-command flakes' {{command}}

# Build the cpcd derivation or fetch a store path
build: (_nix "build")

# Enter development shell
develop: (_nix "develop")

# Run cpcd
run: (_nix "run .#cpcd")

# Run cpcd --help
help: (_nix "run .#cpcd -- --help")

# Format the nix files
fmt: (_nix "run github:nix-community/nixpkgs-fmt -- *.nix")

# Check whether the flake evaluates and run its tests
check *options:
	@just _nix "flake check {{options}}"
	
# Show the outputs provided by a flake
show *options:
	@just _nix "flake show {{options}}"

# Build the cpcd derivation for some target or fetch a store path
cross target='raspberryPi':
	@just _nix "build .#pkgsCross.{{target}}.cpcd"

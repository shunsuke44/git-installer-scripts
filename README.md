# git-installer-script-for-ubuntu20.04
scripts for installing git from source

## Requriements
- Ubuntu 20.04 LTS
- wget
- tar

## Usage
### with default configurations
- `sudo ./installer.sh`
### with custom configurations
- `GIT_PREFIX={path_to_git_prefix} sudo ./installer.sh`

## Configurations
### Environment Variables
- `GIT_PREFIX` : prefix path to install Git (default to `/usr/local`)
- `ZLIB_PREFIX` : prefix path to install Zlib (default to `${GIT_PREFIX}`)
- `GIT_VERSION` : Git version (format: `?.?.?`) (default to `2.37.3`)
- `ZLIB_VERSION` : Zlib version (format: `?.?.?`) (default to `1.2.12`)

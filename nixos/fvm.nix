{ pkgs ? import <nixpkgs> {} }:

let
  # Fetch the latest release information from GitHub
  latestRelease = builtins.fromJSON (builtins.fetchTarball {
    url = "https://api.github.com/repos/leoafarias/fvm/releases/latest";
    # You can use a fixed SHA256 hash for the API response, as it's unlikely to change frequently
    sha256 = "0k1m2d3j4k5l6m7n8o9p0q1r2s3t4u5v6w7x8y9z0a1b2c3d4e5f6g7h8i9j";
  });

  # Extract the download URL for the Linux x64 tarball
  downloadUrl = latestRelease.assets.[0].browser_download_url;

  # Fetch the SHA256 hash for the download URL
  fvm = pkgs.fetchurl {
    url = downloadUrl;
    sha256 = builtins.fetchTarball {
      url = downloadUrl;
    }.sha256;
  };
in
fvm

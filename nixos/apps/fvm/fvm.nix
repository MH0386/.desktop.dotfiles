{
  pkgs,
  lib,
  builtins,
}:
let
  version =
    (builtins.fromJSON (
      builtins.readFile (
        builtins.fetchurl {
          url = "https://api.github.com/repos/leoafarias/fvm/releases/latest";
          sha256 = "1ciiq86vhsqzxhj9944vfg7appplf7qrcl5lvn4bl29ww25p0gzn";
        }
      )
    )).tag_name;
in
pkgs.stdenv.mkDerivation {
  pname = "fvm";
  version = version;
  src = builtins.fetchTarball {
    url = "https://github.com/leoafarias/fvm/releases/download/${version}/fvm-${version}-linux-x64.tar.gz";
    sha256 = "1g4dp42ihg9svqwjxj5lijx33d8vhyczpyn03dgrxi0iwqlc391b";
  };
  installPhase = "mkdir -p $out/bin; cp -r * $out/bin/";
}

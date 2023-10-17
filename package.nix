{ stdenv
, cmake
, SDL2
}: stdenv.mkDerivation {
  name = "sdlfoo";
  version = "0.0";

  src = ./.;

  buildInputs = [
    SDL2
  ];

  buildPhase = ''
    mkdir -p $out
    ${stdenv.cc}/bin/c++ -Wall -O -g -o $out/sdlfoo main.cpp -lSDL2

  '';
}

{ stdenv
, cmake
, SDL2
}: stdenv.mkDerivation {
  name = "sdlfoo";
  version = "0.0";

  src = ./.;

  buildPhase = ''
    mkdir -p $out
    ${stdenv.cc}/bin/${stdenv.cc.targetPrefix}c++ \
      -Wall -O -g \
      -o $out/sdlfoo main.cpp \
      -L${SDL2}/bin -L${SDL2}/lib -lSDL2 -I${SDL2}/include
  '';
}

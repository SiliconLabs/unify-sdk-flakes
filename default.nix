{ lib
, fetchFromGitHub
, gcc8Stdenv
, cmake
, mbedtls
, just
}:

gcc8Stdenv.mkDerivation {
  pname = "cpcd";
  version = "4.2.0";
  src = fetchFromGitHub {
    owner = "SiliconLabs";
    repo = "cpc-daemon";
    rev = "2036da8fa5aa7bd42b127b5bb603cab7a49e6fcd";
    sha256 = "sha256-+q4hoDMvX5yYWA5E/pqJl0diD46EQhzsi2yW/TpapxM=";
  };

  nativeBuildInputs = [ cmake just ];
  buildInputs = [ mbedtls ];

  buildPhase = ''
    cmake .
  '';
  installPhase = ''
    make install
  '';

  meta = with lib; {
    description = "SiliconLabs cpc-daemon";
    homepage = "https://github.com/SiliconLabs/cpc-daemon";
    license = "www.silabs.com/about-us/legal/master-software-license-agreement";
    maintainers = with maintainers; [ ];
  };
}

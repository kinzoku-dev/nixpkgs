{ lib
, stdenv
, autoconf
, automake
, fetchFromGitHub
, json_c
, libpcap
, libtool
, pkg-config
, which
}:

stdenv.mkDerivation rec {
  pname = "ndpi";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "ntop";
    repo = "nDPI";
    rev = "refs/tags/${version}";
    hash = "sha256-ZWWuyPGl+hbrfXdtPvCBqMReuJ4FiGx+qiI7qCz6wtQ=";
  };

  configureScript = "./autogen.sh";

  nativeBuildInputs = [
    autoconf
    automake
    libtool
    pkg-config
    which
  ];

  buildInputs = [
    json_c
    libpcap
  ];

  meta = with lib; {
    description = "A library for deep-packet inspection";
    longDescription = ''
      nDPI is a library for deep-packet inspection based on OpenDPI.
    '';
    homepage = "https://www.ntop.org/products/deep-packet-inspection/ndpi/";
    changelog = "https://github.com/ntop/nDPI/blob/${version}/CHANGELOG.md";
    license = with licenses; [ lgpl3Plus bsd3 ];
    maintainers = with maintainers; [ takikawa ];
    mainProgram = "ndpiReader";
    platforms = with platforms; unix;
  };
}

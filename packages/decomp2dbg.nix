{
  buildPythonPackage,
  fetchPypi,
  libbs,
  sortedcontainers,
  pyelftools,
}: let
  pname = "decomp2dbg";
  version = "3.8.5";
in
  buildPythonPackage {
    inherit pname version;
    doCheck = false;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-Uhfur3mMVcR3mV5V+VBhISqGOiSErdfA3a/Le0wEhrI=";
    };

    propagatedBuildInputs = [libbs sortedcontainers pyelftools];
  }

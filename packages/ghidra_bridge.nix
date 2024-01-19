{
  buildPythonPackage,
  fetchPypi,
  jfx_bridge
}: let
  pname = "ghidra_bridge";
  version = "1.0.0";
in
  buildPythonPackage {
    inherit pname version;

    # hack since git at build time is pain (I tried ;-;)
    patches = [./patches/ghidra-bridge-version.patch];
    doCheck = false;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-OnvfnIwdx4rNPoz+lknQ6VVOR+FHQ1cwEE7+5jSwHJ0=";
    };

    propagatedBuildInputs = [jfx_bridge];
  }

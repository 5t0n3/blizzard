{
  buildPythonPackage,
  fetchPypi,
}: let
  pname = "jfx_bridge";
  version = "1.0.0";
in
  buildPythonPackage {
    inherit pname version;

    # hack since git at build time is pain (I tried)
    patches = [./patches/jfx-bridge-version.patch];
    doCheck = false;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-4pG1H1EL0lh2GUNPlMifDIBZNsSSkkwNkF6SIvopByk=";
    };
  }

{
  buildPythonPackage,
  fetchPypi,
  ghidra_bridge,
  pyside6,
  setuptools,
  gitpython,
  tqdm,
  prompt-toolkit,
  filelock,
  pycparser,
}: let
  pname = "binsync";
  version = "3.26.2";
in
  buildPythonPackage {
    pname = "binsync";
    version = "3.26.2";

    format = "pyproject";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-j0fElievLQMykW+ompfpNS++APsbKt894RZjQlkYLCs=";
    };

    # TODO: git necessary?
    propagatedBuildInputs = [ghidra_bridge pyside6 setuptools gitpython tqdm prompt-toolkit filelock pycparser];
  }

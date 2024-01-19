{
  buildPythonPackage,
  fetchPypi,
  toml,
  pycparser,
  setuptools,
  prompt-toolkit,
  tqdm,
  ghidra_bridge,
}: let
  pname = "libbs";
  version = "0.18.0";
in
  buildPythonPackage {
    inherit pname version;

    doCheck = false;

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-4VGk5lhSYHSwWXC/b22gY5N9D/j+CkzNiNZH1jyv6oY=";
    };

    propagatedBuildInputs = [toml pycparser setuptools prompt-toolkit tqdm ghidra_bridge];
  }

final: prev: let
  callPackage = final.python3Packages.callPackage;
  jfx_bridge =
    callPackage ./jfx_bridge.nix {};
  ghidra_bridge = callPackage ./ghidra_bridge.nix {
    inherit jfx_bridge;
  };
  libbs = callPackage ./libbs.nix {
    inherit ghidra_bridge;
  };
in {
  inherit jfx_bridge ghidra_bridge libbs;

  decomp2dbg = callPackage ./decomp2dbg.nix {
    inherit libbs;
  };

  binsync = callPackage ./binsync.nix {
    inherit ghidra_bridge;
  };
}

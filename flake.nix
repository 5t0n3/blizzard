{
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [self.overlays.default];
    };
    inherit (pkgs) mkShell python3 pwndbg decomp2dbg binsync;

    decomp-gdb = pkgs.writeShellApplication {
      name = "gdb";

      runtimeInputs = [pwndbg];

      text = ''
        # TODO: figure out specific python versioning in path
        pwndbg -ex "source ${decomp2dbg}/lib/python3.11/site-packages/decomp2dbg/d2d.py"
      '';
    };

    python = python3.withPackages (nixpkgs.lib.attrVals ["pwntools"]);
  in {
    overlays.default = import ./packages/overlay.nix;

    devShells.${system}.default = mkShell {
      packages = [python decomp2dbg binsync decomp-gdb];
    };
  };
}

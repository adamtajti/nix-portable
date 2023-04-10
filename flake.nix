{
  description = "portable-nix with Nix 2.10.2";

  # The nixpkgs revision to use
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
  # The nix revision to use
  inputs.nix.url = "github:NixOS/nix/2.10.2";
  inputs.nix.inputs.nixpkgs.follows = "nixpkgs";
  # We don't need to benchmark Nix here.
  # Let's opt out the additional nixpkgs
  # that causes constant changes of `flake.lock`.
  inputs.nix.inputs.nixpkgs-regression.follows = "nixpkgs";
  inputs.nix-portable-flake.url = "github:DavHau/nix-portable/v009";
  inputs.nix-portable-flake.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nix-portable-flake.inputs.defaultChannel.follows = "nixpkgs";
  inputs.nix-portable-flake.inputs.nix.follows = "nix";

  outputs = { nix-portable-flake, ... }: nix-portable-flake.outputs;
}
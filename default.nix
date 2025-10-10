{
  pkgs,
  ruby,
  nix,
}:

pkgs.buildRubyGem rec {
  version = "0.0.7";
  gemName = "bundix";
  src = ./.;

  inherit ruby;

  propagatedBuildInputs = [ nix ];

  meta = {
    inherit version;
    description = "Creates Nix packages from Gemfiles";
    longDescription = ''
      This is a tool that converts Gemfile.lock files to nix expressions.

      The output is then usable by the bundlerEnv derivation to list all the
      dependencies of a ruby package.
    '';
    homepage = "https://github.com/inscapist/bundix";
    license = "MIT";
    maintainers = with pkgs.lib.maintainers; [
      manveru
      zimbatm
      inscapist
    ];
  };
}

{
  description = "Fixture: gives Renovate's nix manager a flake.lock to refresh";

  # One small input keeps the `nix flake update` that Renovate runs fast.
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = _: { };
}

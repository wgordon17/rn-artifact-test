# rn-artifact-test

Reference fixture repo for **[khepri-deps/renovate](https://github.com/khepri-deps/renovate)**.

It is a [poetry](https://python-poetry.org/) project pinned to an outdated
dependency (`idna==3.4`). Poetry is **not** installed by the khepri-deps Renovate
workflow, so running Renovate against this repo with `binarySource=global` in an
environment lacking poetry reproduces a real `artifactErrors` where the lock-file
tool could not run — the exact scenario the workflow's `Classify artifact errors`
step must catch (fail the run + email), as opposed to a dependency-resolution
conflict (which only warns).

Used to validate / re-capture the classifier's test fixtures against new Renovate
versions. See `tests/artifact-classifier/README.md` in khepri-deps/renovate.

It also carries a minimal Nix flake (`flake.nix`, `flake.lock`). Nix **is**
installed by the workflow, so its pull-request run points Renovate at this repo
with only the `nix` manager enabled and expects `nix flake update` to run
without an artifact error: the positive counterpart to the poetry case.

This repo intentionally has no CI and holds no secrets.

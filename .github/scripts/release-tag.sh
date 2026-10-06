#!/usr/bin/env bash
# Decides whether the checked-out commit publishes a schema release.
#
# The release tag is v<schemaVersion> from eaw/_index.json. Servers resolve the newest release in
# their supported range, so a tag is a promise: it never moves, and its content never changes.
#
#   tag does not exist                     -> release=true
#   tag exists, eaw/ and lua/ unchanged    -> release=false (a README-only merge publishes nothing)
#   tag exists, eaw/ or lua/ changed       -> release=false with a notice: unreleased changes are
#                                             pending on main until the version is bumped. With
#                                             STRICT=true (the manual dispatch used at ship time)
#                                             this case fails instead: the bump was forgotten.
#
# The version bump is the publish signal. main may run ahead of the newest release between
# releases; one bump publishes everything accumulated since the last tag.
#
# Writes tag=... and release=... to $GITHUB_OUTPUT when set, to stdout otherwise.
# Needs the full history and the tags (actions/checkout with fetch-depth: 0).

set -euo pipefail

out=${GITHUB_OUTPUT:-/dev/stdout}
strict=${STRICT:-false}

version=$(sed -n 's/.*"schemaVersion"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' eaw/_index.json | head -n 1)
if ! [[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "::error file=eaw/_index.json::schemaVersion '$version' is not MAJOR.MINOR.PATCH"
  exit 1
fi
tag="v$version"
echo "tag=$tag" >>"$out"

if ! git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
  echo "release=true" >>"$out"
  echo "Publishing $tag"
  exit 0
fi

if git diff --quiet "$tag" HEAD -- eaw lua; then
  echo "release=false" >>"$out"
  echo "::notice::No schema change since $tag - nothing to publish"
  exit 0
fi

if [[ $strict == "true" ]]; then
  echo "::error file=eaw/_index.json::eaw/ or lua/ changed since $tag, but schemaVersion is still $version - bump it"
  exit 1
fi

echo "release=false" >>"$out"
echo "::notice::eaw/ or lua/ changed since $tag with schemaVersion still $version - unreleased changes pending until the version is bumped"
exit 0

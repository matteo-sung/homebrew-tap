#!/usr/bin/env bash
# Regenerate Formula/lockvet.rb for a given release tag.
# Usage: scripts/update-formula.sh v0.1.3
set -euo pipefail

TAG="${1:?usage: update-formula.sh <tag, e.g. v0.1.3>}"
VERSION="${TAG#v}"
REPO="matteo-sung/lockvet"
BASE="https://github.com/${REPO}/releases/download/${TAG}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
curl -fsSL "${BASE}/checksums.txt" -o "$tmp"

sha() { awk -v f="lockvet_${TAG}_$1.tar.gz" '$2==f{print $1}' "$tmp"; }

DARWIN_ARM64="$(sha darwin_arm64)"
DARWIN_AMD64="$(sha darwin_amd64)"
LINUX_ARM64="$(sha linux_arm64)"
LINUX_AMD64="$(sha linux_amd64)"

for v in DARWIN_ARM64 DARWIN_AMD64 LINUX_ARM64 LINUX_AMD64; do
  [ -n "${!v}" ] || { echo "missing checksum for $v" >&2; exit 1; }
done

cat > "${ROOT}/Formula/lockvet.rb" <<EOF
# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "${VERSION}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "${BASE}/lockvet_${TAG}_darwin_arm64.tar.gz"
      sha256 "${DARWIN_ARM64}"
    else
      url "${BASE}/lockvet_${TAG}_darwin_amd64.tar.gz"
      sha256 "${DARWIN_AMD64}"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "${BASE}/lockvet_${TAG}_linux_arm64.tar.gz"
      sha256 "${LINUX_ARM64}"
    else
      url "${BASE}/lockvet_${TAG}_linux_amd64.tar.gz"
      sha256 "${LINUX_AMD64}"
    end
  end

  def install
    bin.install "lockvet"
    if (buildpath/"completions").exist?
      bash_completion.install "completions/lockvet.bash"
      zsh_completion.install "completions/_lockvet"
      fish_completion.install "completions/lockvet.fish"
      man1.install "man/lockvet.1"
    end
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end
EOF

echo "Formula updated to ${TAG}."

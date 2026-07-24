# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.15/lockvet_v0.1.15_darwin_arm64.tar.gz"
      sha256 "5285f313b4a99509a77edcf07f53018507335432cce9ccfc70e6f4098dddd58e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.15/lockvet_v0.1.15_darwin_amd64.tar.gz"
      sha256 "c840ecb57b3e6e4f711de4dd3471c6c00a16c434e69e3449df5c143ebf511dec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.15/lockvet_v0.1.15_linux_arm64.tar.gz"
      sha256 "3be221e81c05a6946d67b0bd07b76a13c92a46a33d466ad5a358a2ba5d52eb21"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.15/lockvet_v0.1.15_linux_amd64.tar.gz"
      sha256 "ae7e88288ccf13399cb443e9de0ed4386ea072e485a7d2e4ff48d3a0f1b1498b"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

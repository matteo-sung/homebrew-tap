# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.3/lockvet_v0.1.3_darwin_arm64.tar.gz"
      sha256 "09ccb78c3eb3e5a3ad698d0ba705a429993ba0a95c379c47a9128d170353bf75"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.3/lockvet_v0.1.3_darwin_amd64.tar.gz"
      sha256 "a74f1f95884f53e7c5224bce167bd69ae3268e98a4ecc3a6fa130e591d660533"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.3/lockvet_v0.1.3_linux_arm64.tar.gz"
      sha256 "fd554f9c82728bb52c8f091af33c4267d39128d11409c3fe329cd6be1ce62a09"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.3/lockvet_v0.1.3_linux_amd64.tar.gz"
      sha256 "d1d0a6fb09f9222318e72289ae09b8b29047303c6a7443b1f5c03235aa7aa0c3"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

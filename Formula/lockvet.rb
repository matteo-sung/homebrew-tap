# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.6/lockvet_v0.1.6_darwin_arm64.tar.gz"
      sha256 "3f55c434d160cedc063aaefddcbf7cc625c4562d34e52523e0e21c16b06940fb"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.6/lockvet_v0.1.6_darwin_amd64.tar.gz"
      sha256 "f6c3895b2ccf87d0f11d95547d4452c56c80698748024b8337c24ece4102c549"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.6/lockvet_v0.1.6_linux_arm64.tar.gz"
      sha256 "46985d5b4cdd5ad194b1592fff28d7659b6f042447f30800c74b8f767eded4c5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.6/lockvet_v0.1.6_linux_amd64.tar.gz"
      sha256 "35a4f58b91b1d6645578adfe28d39028988c8aaf6bfe28c3f5707461c7434aee"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

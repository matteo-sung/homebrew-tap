# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.16/lockvet_v0.1.16_darwin_arm64.tar.gz"
      sha256 "d6079fb7ca3c1f03152a1b364fd2d4774c16476c7ec39aee1b016bf084a4ce82"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.16/lockvet_v0.1.16_darwin_amd64.tar.gz"
      sha256 "988609d1bde995806b1c2e6a1419cc374547281f0b8499b1653146c3dd0b45c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.16/lockvet_v0.1.16_linux_arm64.tar.gz"
      sha256 "3fa89b273b787026fb988e01218cedc4a4b77a422cf90fd642fcffa9a60a2b19"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.16/lockvet_v0.1.16_linux_amd64.tar.gz"
      sha256 "8ba917ad3592725ca63b3147a75512ab4432ef746c58bf5c19c1baf45a8d3b6f"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.14/lockvet_v0.1.14_darwin_arm64.tar.gz"
      sha256 "cad28ef2fe30df6f8b5466e660ba2d5997311f593c00d22a271be28ab2df5784"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.14/lockvet_v0.1.14_darwin_amd64.tar.gz"
      sha256 "383392ca12277c2297a2ccd068c0322f18de333801e3c69a7d24dc0bcf0cf259"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.14/lockvet_v0.1.14_linux_arm64.tar.gz"
      sha256 "b9bc4f2912ec5fe8490f2c1cf910bf97ae2567b7a942b2c82f73841f5dc530cc"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.14/lockvet_v0.1.14_linux_amd64.tar.gz"
      sha256 "ace987484110227ca4237ae85b29685ba38ea852e6b392630cf77785f61cc35c"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

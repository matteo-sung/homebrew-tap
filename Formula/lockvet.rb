# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.3/lockvet_v0.2.3_darwin_arm64.tar.gz"
      sha256 "acc4e30cd2b3a1a8942d463bae2f30fbbe4d202f131c494afb4dc27078d7c1a7"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.3/lockvet_v0.2.3_darwin_amd64.tar.gz"
      sha256 "0ef1c82ea2c9e64f873103d3470e7effef083b1205d1a9e543a0f341dbbb532e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.3/lockvet_v0.2.3_linux_arm64.tar.gz"
      sha256 "29e098431fcf5ecdf4de37408c69dcde84644ba5fe85bbb45efc41dfe63e02ef"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.3/lockvet_v0.2.3_linux_amd64.tar.gz"
      sha256 "d713dee3a4875a7b21e7b3aeab192c1482611fafdca5595280ebb6cf3426f75c"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

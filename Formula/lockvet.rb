# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.9/lockvet_v0.1.9_darwin_arm64.tar.gz"
      sha256 "4a825af8b28b6ca168a42c3f2405856d782087d666ec2ccc3d360f051e9b1dbd"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.9/lockvet_v0.1.9_darwin_amd64.tar.gz"
      sha256 "a74a6e92c412f0c678d2b81684f2d31169227465b6cd12003c66ee4c3b9f1f01"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.9/lockvet_v0.1.9_linux_arm64.tar.gz"
      sha256 "80a78b6a0d856e431b9af6b04a1a964683c2a3476595c8606cb03e0d2cf10367"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.9/lockvet_v0.1.9_linux_amd64.tar.gz"
      sha256 "81415e844486e1bfd09075164a7e784cbd5c3f816eea4eb21d17ae4ab5c17987"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

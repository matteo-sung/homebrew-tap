# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.5/lockvet_v0.1.5_darwin_arm64.tar.gz"
      sha256 "024b1669344d77a014d452fd8d27913ef30ecea169b9bf4c34fe4ce8ddc30dea"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.5/lockvet_v0.1.5_darwin_amd64.tar.gz"
      sha256 "62887e97e419185b57657b8a2f1fca27b96fcbbc577da697e8ae9e0182462e95"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.5/lockvet_v0.1.5_linux_arm64.tar.gz"
      sha256 "8e470206696f51fb410b88b9a4f5ccd5c227a54af8e8ed4816339a41119519a8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.5/lockvet_v0.1.5_linux_amd64.tar.gz"
      sha256 "9fbe438c219bd8f97c4cd502f7d6e4870963a19376db47e8d8a8ca4e92dee01e"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

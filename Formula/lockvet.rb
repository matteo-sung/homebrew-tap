# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.2/lockvet_v0.1.2_darwin_arm64.tar.gz"
      sha256 "5a45eec235ad0c4bd536ddd586623f1a65db914f97810a8194387b9dcedb07e4"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.2/lockvet_v0.1.2_darwin_amd64.tar.gz"
      sha256 "49ad9faf919668fa45533d1cd298f76869685e4ff3c3b68e8fdc2e255fc962d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.2/lockvet_v0.1.2_linux_arm64.tar.gz"
      sha256 "acc8335eec9542a77ffc59f2679f7c3c6b5ecb7bb4b1f89d6745d9e156bf7226"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.2/lockvet_v0.1.2_linux_amd64.tar.gz"
      sha256 "082ce9091a6b57bb6e016bebe9068063e8328e01b44f1ae51adf00f5f4c9380e"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.7/lockvet_v0.1.7_darwin_arm64.tar.gz"
      sha256 "5719279d20f9dc1792eb15eb8f5190fcd1b5bd827091b9bd1e7bb42555390e9d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.7/lockvet_v0.1.7_darwin_amd64.tar.gz"
      sha256 "069c752400d6101aaf430b6b9d26f0007c49d49d832caa5ebc9ef7ab4cdd9c26"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.7/lockvet_v0.1.7_linux_arm64.tar.gz"
      sha256 "89118c52a7cd9487d9c5be2e669589b851d7e08440575ee1abb10ee9be2e8f4d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.7/lockvet_v0.1.7_linux_amd64.tar.gz"
      sha256 "e0d173cce08e8ea7b3e95b391e4f0f2e8242ec347609a67e7a8e0e2a28f53e99"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

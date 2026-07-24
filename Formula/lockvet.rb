# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.8/lockvet_v0.1.8_darwin_arm64.tar.gz"
      sha256 "8dadf5ed9e749440da8b31d0a2b2d4865295e7f456ffc7a760b18011f057ef5c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.8/lockvet_v0.1.8_darwin_amd64.tar.gz"
      sha256 "62b880161a889bbf156a92aa476041e38f9fcf096d74249538173936306ee057"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.8/lockvet_v0.1.8_linux_arm64.tar.gz"
      sha256 "c391523e264415a9e76aa3b7a1116a8c91db916b35c3077f09fab6b31feb02e1"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.8/lockvet_v0.1.8_linux_amd64.tar.gz"
      sha256 "0ca366c6d241f9f3972e0e8f56a73f6322657b5aba42f1a3d81dba5cb8b2599a"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

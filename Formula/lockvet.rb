# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.11/lockvet_v0.1.11_darwin_arm64.tar.gz"
      sha256 "9c081326b921e32541de144cc8ad3de7441cae4283294218cdce01887fa0561c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.11/lockvet_v0.1.11_darwin_amd64.tar.gz"
      sha256 "0bccbb63e5ddda4a05eda2b059c8d5f455ead5fd9baf381a787d8a11866ef271"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.11/lockvet_v0.1.11_linux_arm64.tar.gz"
      sha256 "a32d54e2f5f17361ccce5ffc8d43c6bbe831b31704c4620f1bbae21008e8deb5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.11/lockvet_v0.1.11_linux_amd64.tar.gz"
      sha256 "9b5d0c3613aa191f80c5f798b33b1ec71b4e9d67c2a02a75ce8f72ed901aec81"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

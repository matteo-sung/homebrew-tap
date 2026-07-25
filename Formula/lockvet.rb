# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.18/lockvet_v0.1.18_darwin_arm64.tar.gz"
      sha256 "6983c2d473eec8fd6f8a59a17326d208aef7075778b72400df0766ce517db3b7"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.18/lockvet_v0.1.18_darwin_amd64.tar.gz"
      sha256 "9a47bea8ce9be7516698da12efedade0eb9c8a95110eb2f19001814bfe971629"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.18/lockvet_v0.1.18_linux_arm64.tar.gz"
      sha256 "09713ef3403d4204a3447981017b9eb31e361899fcdef35a0fad7bcd9d6e9ee9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.18/lockvet_v0.1.18_linux_amd64.tar.gz"
      sha256 "ad9db64aa5fcd7f92de5468625be4b32e71b9a85b75961f3e1c2d8b8475b99b2"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.1/lockvet_v0.2.1_darwin_arm64.tar.gz"
      sha256 "cba779e246e48451b6aa973ade0179bc7648c2cf96ca196490df4c51ee35a854"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.1/lockvet_v0.2.1_darwin_amd64.tar.gz"
      sha256 "7737d8d464fa94ec9749e6cad0d5b3ed6c33dea7bd82d30cca503bdcc4e25997"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.1/lockvet_v0.2.1_linux_arm64.tar.gz"
      sha256 "6e671b2fde86816ad4d8233edee017837fed26c8ef0bf6eff8c6d0d1061fd642"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.1/lockvet_v0.2.1_linux_amd64.tar.gz"
      sha256 "c7222f377f4216be5f753bd1ade8168c7d711a5a7f407bc8092b74129ad7718a"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.17/lockvet_v0.1.17_darwin_arm64.tar.gz"
      sha256 "13ae957d33607b8eb1d7fb8bb22eb0b6ae45ce57d62a909c116abe73e08cb6ef"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.17/lockvet_v0.1.17_darwin_amd64.tar.gz"
      sha256 "ea124127dfc1b6fb1297cc6f76d74249700b410754e3266878fd67739769d5b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.17/lockvet_v0.1.17_linux_arm64.tar.gz"
      sha256 "28a17a111e17d96a3b6658f9eb2911dd85edf16991f920e1eddce99191e6eef6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.17/lockvet_v0.1.17_linux_amd64.tar.gz"
      sha256 "f5ff3a0501409e37ae109743f0d28ad57220b67b2ddc14fef99f799e638fab97"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

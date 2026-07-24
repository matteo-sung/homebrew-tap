# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.13/lockvet_v0.1.13_darwin_arm64.tar.gz"
      sha256 "33b37e558fa67210381a8cddb8c68c79650c7cf6eb05a348cb1e42c7e5828bd8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.13/lockvet_v0.1.13_darwin_amd64.tar.gz"
      sha256 "64f86b8efb42b27001575a806469a534336c4f3f5924b0cac9e7ae33b104548c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.13/lockvet_v0.1.13_linux_arm64.tar.gz"
      sha256 "c73aed5bac65c6e9360b9ec9f99694328f2f0991baa4f954d5dc289ea5495454"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.13/lockvet_v0.1.13_linux_amd64.tar.gz"
      sha256 "1ed4d20355ea5166c0a11426ca7ff51f0dbc35ffe1ec6a50001a60fa65846100"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

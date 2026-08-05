# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.12/lockvet_v0.3.12_darwin_arm64.tar.gz"
      sha256 "d5fcd14fed31b5c2fa1452bf7d525891891b3ce39601c4ff868c0d711eecf313"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.12/lockvet_v0.3.12_darwin_amd64.tar.gz"
      sha256 "7cd70b301b0a1900dd0ee24839a4ab49eb2357db7d4cd2bad5d8bf81f4747df3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.12/lockvet_v0.3.12_linux_arm64.tar.gz"
      sha256 "bf0a39551bcaa309ec906fc568592f37ddc8e8a40d96f44762741e7db58161d0"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.12/lockvet_v0.3.12_linux_amd64.tar.gz"
      sha256 "57e241112291c753dce938a1544b8aeb988abe351461104d4090120692b2fc6f"
    end
  end

  def install
    bin.install "lockvet"
    if (buildpath/"completions").exist?
      bash_completion.install "completions/lockvet.bash"
      zsh_completion.install "completions/_lockvet"
      fish_completion.install "completions/lockvet.fish"
      man1.install "man/lockvet.1"
    end
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

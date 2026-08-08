# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.13/lockvet_v0.5.13_darwin_arm64.tar.gz"
      sha256 "e544640f706350e66bf4395fec839e457a654f754b391e55fe36c30a0ba811b5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.13/lockvet_v0.5.13_darwin_amd64.tar.gz"
      sha256 "e4704223bad600516a65bbd794b4f949347f18cfbe40f4bb58589824b7b0ab37"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.13/lockvet_v0.5.13_linux_arm64.tar.gz"
      sha256 "bc6776fc3c19e4b75e83f4d94c2a66401474894cffc301696854ad7b21f88c5b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.13/lockvet_v0.5.13_linux_amd64.tar.gz"
      sha256 "5c42b0777107d2e386ff0cdc3db3ba2d18323bb2f5903562608571871c014cd1"
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

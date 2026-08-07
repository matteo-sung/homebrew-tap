# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.10/lockvet_v0.5.10_darwin_arm64.tar.gz"
      sha256 "8dfdc4697060ef9ee5647a4a3b85d18a97b7af7155a892b59a67550f8c164c37"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.10/lockvet_v0.5.10_darwin_amd64.tar.gz"
      sha256 "5f5a80e6cf83729bb363c24f44cd2ecce69ea802dc89f7511110f1683fefcee8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.10/lockvet_v0.5.10_linux_arm64.tar.gz"
      sha256 "1c5fa75835cd4138d72442abf2ff31ae7f35e05dd5c5d85ab4c21c45f12821b6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.10/lockvet_v0.5.10_linux_amd64.tar.gz"
      sha256 "bdbcc7d073d2f9f8ff9c22c6624df8b300fc9335f8f201b1f0b37f17c733ef0d"
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

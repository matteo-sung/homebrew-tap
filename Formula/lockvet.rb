# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.6/lockvet_v0.5.6_darwin_arm64.tar.gz"
      sha256 "4b010cbf2a804c6299a25230feb1c6ffbed4411f74853ae81b8457ae2a191129"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.6/lockvet_v0.5.6_darwin_amd64.tar.gz"
      sha256 "067935e8301861b9a9603cedb683a423623e6e6a03990990f36cd30cad78a91f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.6/lockvet_v0.5.6_linux_arm64.tar.gz"
      sha256 "3fdaee979233d5ed1c512f2f0132507c56a5d886510152bcdfaebc8293ab9611"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.6/lockvet_v0.5.6_linux_amd64.tar.gz"
      sha256 "1587d3e4e6fbfce030eead91ecf663651c06909e8598de71eef3486a5dd34eca"
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

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.18/lockvet_v0.3.18_darwin_arm64.tar.gz"
      sha256 "7b0359907292b0cd85702b79fd9f15db602c674ce39c5de4540e057b745f5e56"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.18/lockvet_v0.3.18_darwin_amd64.tar.gz"
      sha256 "20cc24e328b21df81c9009c0ac92287f103fad2a29e5f04d5557ca914b7497ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.18/lockvet_v0.3.18_linux_arm64.tar.gz"
      sha256 "e88e10b28be9bfd460c4c2c5bd64c49a4125c86d4690045d3421f1b250fd2a9e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.18/lockvet_v0.3.18_linux_amd64.tar.gz"
      sha256 "733e15020919adbe467b5623b5c324e7499e2bbdf35ed6dea35c732c22e9e829"
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

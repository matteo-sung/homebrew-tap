# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.6/lockvet_v0.6.6_darwin_arm64.tar.gz"
      sha256 "2dc70a4db16bb75fe878a7d045a453d9fd985fa2e7c36b0040736a94d18b4abb"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.6/lockvet_v0.6.6_darwin_amd64.tar.gz"
      sha256 "47379ec94f04cb77ebcced7196f9c9a68d4d4d75286f3108c95176172c1b557c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.6/lockvet_v0.6.6_linux_arm64.tar.gz"
      sha256 "f8e3748f83defa2842d0ada26a8acefb0c5d8668aca214291870abd4a41d28b3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.6/lockvet_v0.6.6_linux_amd64.tar.gz"
      sha256 "0dfdd5069eefe723ecda6351176d2da7d34a0bb5e4fbe17a7163059575dc8c10"
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

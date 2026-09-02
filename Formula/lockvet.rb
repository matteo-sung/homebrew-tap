# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.15/lockvet_v0.6.15_darwin_arm64.tar.gz"
      sha256 "7556cd7ea5b4b8f36efde8911954477ee94f286f284cb52fff3be5288f1253a3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.15/lockvet_v0.6.15_darwin_amd64.tar.gz"
      sha256 "d8707def2b9b558d520792c505677e336c9aa11b569309f58ca553eac0a76be5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.15/lockvet_v0.6.15_linux_arm64.tar.gz"
      sha256 "e9301d30f9821bfb238b4ac622e9663793a61c24f4311c46660c386b868f3991"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.15/lockvet_v0.6.15_linux_amd64.tar.gz"
      sha256 "4d05cbe394c88b47d1312d47328c03fac91468e2231bf3ce8981eae99ebdc0a3"
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

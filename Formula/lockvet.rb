# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.20/lockvet_v0.5.20_darwin_arm64.tar.gz"
      sha256 "f0c197ac5ca9fc76f7f5333f2b123b2302b5e6d988d43df7c09d756a5655bdab"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.20/lockvet_v0.5.20_darwin_amd64.tar.gz"
      sha256 "b968cbdcff21cf981d4c599630718256b75de50be51bf0d88c0db54c48660c35"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.20/lockvet_v0.5.20_linux_arm64.tar.gz"
      sha256 "ff7cfd987f409b61337644daff1e57cc11026b3b80753b126a32f3fe54759baa"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.20/lockvet_v0.5.20_linux_amd64.tar.gz"
      sha256 "4315188f7a0af227a96cfa0f14f5879f009825a85e4e405e78dbd43839515343"
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

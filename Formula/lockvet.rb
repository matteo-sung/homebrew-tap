# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.8/lockvet_v0.5.8_darwin_arm64.tar.gz"
      sha256 "bd1a5955d13d5d982bde7b5f025f793ec53958fc06625651db6e9b920be71088"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.8/lockvet_v0.5.8_darwin_amd64.tar.gz"
      sha256 "db527328dd59cd5ae0097fb129917f16f6769d8d5a816dfd6b146b1790f76ad2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.8/lockvet_v0.5.8_linux_arm64.tar.gz"
      sha256 "6940e277c3d007e02d0c8e663b8e43150fa1e45ef2e5abf469028f2e49b5b7a2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.8/lockvet_v0.5.8_linux_amd64.tar.gz"
      sha256 "6420e0048102fba8efe7eadbeaef5ecad58c5b07f99fac02c2fae399d51d9bfc"
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

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.7/lockvet_v0.4.7_darwin_arm64.tar.gz"
      sha256 "44ae21c8ea6c2d780e46150f2f5c5986785e066d535f81e7e98485296b40c44c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.7/lockvet_v0.4.7_darwin_amd64.tar.gz"
      sha256 "9eb98ffad22b7e1a9d001a5bfb69c3bba1f86bb04b1d4c7b2ab0da998666794f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.7/lockvet_v0.4.7_linux_arm64.tar.gz"
      sha256 "d27f2c4eeee259a08b5398b252ddb182d59c8348884291537076703b11b125bf"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.7/lockvet_v0.4.7_linux_amd64.tar.gz"
      sha256 "bfcd40f5933eda0f6c191961562db4fccc279cc0f13019b8dd81573f53e6e1df"
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

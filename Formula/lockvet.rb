# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.10/lockvet_v0.6.10_darwin_arm64.tar.gz"
      sha256 "7fa697035566bb551946f2ce7f86abb34286e8d9f4cbb0a39c0871054fa80a72"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.10/lockvet_v0.6.10_darwin_amd64.tar.gz"
      sha256 "f2c647496257147c686333a15267b09a8a6bcf4c24c715654f830f73eb4f1d68"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.10/lockvet_v0.6.10_linux_arm64.tar.gz"
      sha256 "eba3139b23c8e3f2b05f90705ad492c7abc884c602c52d8eac2939328dfa5c6f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.10/lockvet_v0.6.10_linux_amd64.tar.gz"
      sha256 "20397dc5ac71256b5bc0f72e0f6fb4a4c90f5455802fab7ef9327e535d724e47"
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

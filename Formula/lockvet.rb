# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.23/lockvet_v0.5.23_darwin_arm64.tar.gz"
      sha256 "fe3147e3b335daffb1c2a507d1aea20cb60d5a22d6446df6e76eb32d483f0b24"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.23/lockvet_v0.5.23_darwin_amd64.tar.gz"
      sha256 "c4af2a7a157fddd8024f05f5365f2f718587194599bad04cfb41dceea2a7fdfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.23/lockvet_v0.5.23_linux_arm64.tar.gz"
      sha256 "6b2dcd51982898f76f7e10940abc619122d0f86551b48504759bf5a12179ec14"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.23/lockvet_v0.5.23_linux_amd64.tar.gz"
      sha256 "b8f39720ecd9feea6b7a2b78367645dbdf60da750d61089f018d24478ba240b4"
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

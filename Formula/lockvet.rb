# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.25/lockvet_v0.5.25_darwin_arm64.tar.gz"
      sha256 "b527b168a2f5f158d2c18e5be0c617e5165e1ab8d780ae944566370e126ed344"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.25/lockvet_v0.5.25_darwin_amd64.tar.gz"
      sha256 "6850337394a9a5e15a0b1062f92a0f97e2f75dcfd9eae31555ec8ea1d324b32e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.25/lockvet_v0.5.25_linux_arm64.tar.gz"
      sha256 "7c0f2f298bd8ae8a93822303d1947163ebeb9e70dad09c7e941e7b1fb23d35c2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.25/lockvet_v0.5.25_linux_amd64.tar.gz"
      sha256 "b2a466b8a3ecbe3c3cfd82c3516bbce3bc0a02be1dc95c77647f059cc14c9259"
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

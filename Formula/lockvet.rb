# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.19/lockvet_v0.5.19_darwin_arm64.tar.gz"
      sha256 "cc41e3e6c3985825d35c82ff74bbb19c659de930313d5c8ca6e711bfb71f716c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.19/lockvet_v0.5.19_darwin_amd64.tar.gz"
      sha256 "6dbaf5c32eb85580ac6d9ada5b6dc0868f8bc73670b5331feb0f6ffe97350a4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.19/lockvet_v0.5.19_linux_arm64.tar.gz"
      sha256 "87c4c1cb9b5e0f89536dc1b2938b104eb9b03f0d8503d2cfc8c36bcb1ef0a170"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.19/lockvet_v0.5.19_linux_amd64.tar.gz"
      sha256 "880722fa55d32c73ee7b198fa0db89ae778dfe38b6dbced3c9b99d2e79ac5ce5"
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

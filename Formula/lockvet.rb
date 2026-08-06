# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.1/lockvet_v0.4.1_darwin_arm64.tar.gz"
      sha256 "9db3fac3cc52bd669b4898f7dc18c3cb42f52eb48239cda673471db3988f4d39"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.1/lockvet_v0.4.1_darwin_amd64.tar.gz"
      sha256 "84548f626b16207028fb4a23c42a8b34625954e13bfc6bb7fa05bf16e4fb0a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.1/lockvet_v0.4.1_linux_arm64.tar.gz"
      sha256 "c4d58d24f28f003d15e8ea924c136d1898c2d7f4b32cc6c30de64c69062ac31e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.1/lockvet_v0.4.1_linux_amd64.tar.gz"
      sha256 "ff5b80ee67f48c38a109e0f0e0f48dfd32fdadd263934bdb97370acbfefbc6ac"
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

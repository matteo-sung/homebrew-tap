# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.2/lockvet_v0.3.2_darwin_arm64.tar.gz"
      sha256 "77e1a345d36784aba316e5edc5f2f265b809062ec370bf69b940d78ec9b6709b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.2/lockvet_v0.3.2_darwin_amd64.tar.gz"
      sha256 "1854d0852edf767f03c7d049abc78aa3b38aca756b7ed70a09f9fadac041e3ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.2/lockvet_v0.3.2_linux_arm64.tar.gz"
      sha256 "e5997b0dc8ed81025c2bb1b9851b381bd8236d5dc01cd5b6af1459d546343e14"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.2/lockvet_v0.3.2_linux_amd64.tar.gz"
      sha256 "680f0b0048c8fd20e8634089b85e3e970a02804bf343e1ecf9a7d0f9155acd85"
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

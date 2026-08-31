# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.9/lockvet_v0.6.9_darwin_arm64.tar.gz"
      sha256 "659ef15ade02df7a49bbb319bc19900a90467f35e98941e3041e2db91343a310"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.9/lockvet_v0.6.9_darwin_amd64.tar.gz"
      sha256 "092a621df05ab48538d90dee4477f8ca15d478265e3f7d6cd521c91ec22bd6a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.9/lockvet_v0.6.9_linux_arm64.tar.gz"
      sha256 "33c6c507bb596b31472e741452fa5dc6289176bec6dfa0d22bec7dca45ee369d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.9/lockvet_v0.6.9_linux_amd64.tar.gz"
      sha256 "341c7be159211b25895485310adf05235bcf02b8e44ef6a0c4c5017f2939d31c"
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

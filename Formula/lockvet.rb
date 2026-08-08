# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.12/lockvet_v0.5.12_darwin_arm64.tar.gz"
      sha256 "8b7ecb9a46584a661625ba59baf1cb95ca4335f84db33a7fd6ee55d3ee0f8e6e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.12/lockvet_v0.5.12_darwin_amd64.tar.gz"
      sha256 "e7a255815bbb85ee3b8631732897172c1b27f3835df7eeb5015f31a0d9fea115"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.12/lockvet_v0.5.12_linux_arm64.tar.gz"
      sha256 "cf6a3cea4126b2fb22ec89b6280d63dc9e774d621713c9fd15e7076085fe9e12"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.12/lockvet_v0.5.12_linux_amd64.tar.gz"
      sha256 "8332ee9170473245ece1018a465cb70cea01348da1a76f0d161e7f591fe80453"
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

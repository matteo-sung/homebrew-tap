# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.28/lockvet_v0.5.28_darwin_arm64.tar.gz"
      sha256 "52c9b9520cdf1f6cc7cd034b05a4223d53e67da7aacfdf464a0e125d43859942"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.28/lockvet_v0.5.28_darwin_amd64.tar.gz"
      sha256 "2255c4c96a65a1ef9e0bc3e5d8565dab8ac0c7bdd27e8770c33e733191240eaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.28/lockvet_v0.5.28_linux_arm64.tar.gz"
      sha256 "99e68f3241311d88a8c6e7bab789b9e20021c2efa77a8dea39bcc69cc19a8e60"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.28/lockvet_v0.5.28_linux_amd64.tar.gz"
      sha256 "5c620eeb70b94a19bd0259f2622c5fe9ceca83045da747baa44954ada7967aed"
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

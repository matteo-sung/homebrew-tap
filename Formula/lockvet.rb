# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.27/lockvet_v0.5.27_darwin_arm64.tar.gz"
      sha256 "aa6dcfff95e5bd3baf9965aabeca1da675269961df9b5e64bc0db551e8531411"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.27/lockvet_v0.5.27_darwin_amd64.tar.gz"
      sha256 "1455c67d7e0e5943619627f2030cb35ac85e5b1bd93ccb543e4145949733d3a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.27/lockvet_v0.5.27_linux_arm64.tar.gz"
      sha256 "ebf2e8eeb3c95045da2fbcbf999f04b7ad220a6a1067ea6d25013ca46aaa7905"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.27/lockvet_v0.5.27_linux_amd64.tar.gz"
      sha256 "d86fd6005f6ba63ad64a21f9cc8627565d5d00270d9bb376758a1bc7c5fcdece"
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

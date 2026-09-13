# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.17/lockvet_v0.6.17_darwin_arm64.tar.gz"
      sha256 "77376764c2e9d416725abb06509c634d74a1b002e490d100b21efaca5c1fa70e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.17/lockvet_v0.6.17_darwin_amd64.tar.gz"
      sha256 "17deffb2fd6024531c57d62b0fac52303817405a9c64ecc06464d62b58bf45da"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.17/lockvet_v0.6.17_linux_arm64.tar.gz"
      sha256 "891f806eb13c05fab088cad844cf9f6e60f1af5302e06b6ff2e2d0f8ebc9eaab"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.17/lockvet_v0.6.17_linux_amd64.tar.gz"
      sha256 "46281e2503d7fd73cc580c9af3f9712fd74fe550bc7e8f4a241561590a0565af"
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

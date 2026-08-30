# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.8/lockvet_v0.6.8_darwin_arm64.tar.gz"
      sha256 "c29e2f4b179e2a3e71f555e947de7602056d3d74ed4a5c476208cbbd78314731"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.8/lockvet_v0.6.8_darwin_amd64.tar.gz"
      sha256 "cb9e70221dc69e3524ebca158eaa132e27638aa6f3ae7c4433a87223c3735729"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.8/lockvet_v0.6.8_linux_arm64.tar.gz"
      sha256 "fce5ec4cea8e96d10874b121d38292bc0537fca334fe2c6f1bfa846ac9c8c875"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.8/lockvet_v0.6.8_linux_amd64.tar.gz"
      sha256 "651f3c41171d928307ac4e8b0f9c723002b434f143389087dc904bd4e430de17"
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

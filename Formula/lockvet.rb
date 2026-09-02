# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.14/lockvet_v0.6.14_darwin_arm64.tar.gz"
      sha256 "d89aedec843bbf24d50a4dc44b18ccceb8797f74492809bf5ebdf8055b39030b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.14/lockvet_v0.6.14_darwin_amd64.tar.gz"
      sha256 "b6db30367dbccb89987cd2c911da2a40afb612ebba7aee20d3e80bfb74652386"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.14/lockvet_v0.6.14_linux_arm64.tar.gz"
      sha256 "6350448d15c9e935ec30c0bad362f9417109b2d062cf2acb451e395d1ca21eb9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.14/lockvet_v0.6.14_linux_amd64.tar.gz"
      sha256 "588b23236232b870e602b4eca51dc25cd53eb7479da362309f8f00d41e232335"
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

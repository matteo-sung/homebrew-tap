# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.11/lockvet_v0.6.11_darwin_arm64.tar.gz"
      sha256 "f0ca09d671f8e10716a19b65957df825e6c5b40375b7ae8745c9e1aa1929fd1f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.11/lockvet_v0.6.11_darwin_amd64.tar.gz"
      sha256 "7c38d98469a1600b2b90fbabd2b1b868522e48c22db0b23bc7e7b07c9a175642"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.11/lockvet_v0.6.11_linux_arm64.tar.gz"
      sha256 "f5deff796897bcb36973763863e63515875afc809c87209376dbf2d9ae97d185"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.11/lockvet_v0.6.11_linux_amd64.tar.gz"
      sha256 "67a28084ada22038cead20949b69f9adecb740696ecafe098dfce2c23775f918"
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

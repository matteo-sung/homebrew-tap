# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.12/lockvet_v0.6.12_darwin_arm64.tar.gz"
      sha256 "b33b1cb6bca2a5441dad6ac125120ac81b3acf7056eba5781e8eb4ab922b0d0b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.12/lockvet_v0.6.12_darwin_amd64.tar.gz"
      sha256 "3c901435f591d67ffd6c4a716c8fb4f9c36fd0ad9cd2378918aec17dbab288d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.12/lockvet_v0.6.12_linux_arm64.tar.gz"
      sha256 "88d44a92f35644bbbe1bb755251bef2b9aaf1d40bb7ab8ca146edba492745f0f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.12/lockvet_v0.6.12_linux_amd64.tar.gz"
      sha256 "33a00c685a03fd83bf0972f8fcb975236dca802535311944f22f15e27d8368c7"
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

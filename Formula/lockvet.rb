# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.15/lockvet_v0.5.15_darwin_arm64.tar.gz"
      sha256 "399dd44823393a9e221e94f0928442254a3d98c800f1e1f9f4261de0ad67cbc0"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.15/lockvet_v0.5.15_darwin_amd64.tar.gz"
      sha256 "c8ed7313baa164e13285a6935fa1e73431d1cd44bdaf223766e98f30d6f6e959"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.15/lockvet_v0.5.15_linux_arm64.tar.gz"
      sha256 "8d9e35c517b1b12b720a69a3dd16dbc89b0a9a0b107edf33b9c88bade5744ab1"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.15/lockvet_v0.5.15_linux_amd64.tar.gz"
      sha256 "2fb7c99eefaca8e17ec2c6b11630c5693a79b2a74f811bdca7567cac72683431"
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

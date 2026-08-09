# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.26/lockvet_v0.5.26_darwin_arm64.tar.gz"
      sha256 "92cb206067e149b479eb1642a0ca531f99f0c3c76496b683a909c9e0c60bcab2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.26/lockvet_v0.5.26_darwin_amd64.tar.gz"
      sha256 "0a54ff5e7155335e463f82e14accbf18b32ef0b62d0a076df1bd452fe2c69d17"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.26/lockvet_v0.5.26_linux_arm64.tar.gz"
      sha256 "f0666b3232306ee61b3a061efade3dac6efdc60bd37b9165bbe1bc22777113ef"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.26/lockvet_v0.5.26_linux_amd64.tar.gz"
      sha256 "9a02b6c78f0a6757c4825f8fddb6f66544720d169a4d18c013b1d2cfa2253d6c"
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

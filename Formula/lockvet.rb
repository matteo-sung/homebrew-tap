# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.17/lockvet_v0.3.17_darwin_arm64.tar.gz"
      sha256 "6b0e310fefed09adadd73e213230fb22cf2cbb3b18bd322aa6f1903070a2d382"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.17/lockvet_v0.3.17_darwin_amd64.tar.gz"
      sha256 "0ec34ecac7b76997dea2241bd0ed94b8150d42f3fd4348b809763f851d64b30b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.17/lockvet_v0.3.17_linux_arm64.tar.gz"
      sha256 "2c6996f90758862c6e6d86efe71317de5aa24e6f49c9928771252ba4bed9b509"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.17/lockvet_v0.3.17_linux_amd64.tar.gz"
      sha256 "faa8bf389c89f27fa02c75b19537f423a0dda37fde1176ca87d71171440de179"
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

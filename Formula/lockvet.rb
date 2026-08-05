# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.7/lockvet_v0.3.7_darwin_arm64.tar.gz"
      sha256 "ee1e667a74ae36851b3d4aadf4539548a82323f6ce199467833235a54a60919f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.7/lockvet_v0.3.7_darwin_amd64.tar.gz"
      sha256 "124cd8e88770a149358000a7cbd816c02b54585afd3a71a01c50642e01609516"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.7/lockvet_v0.3.7_linux_arm64.tar.gz"
      sha256 "f87435694646e54640ba99c911e009c835d2ac25fc81e63d83c60bbc46ff4087"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.7/lockvet_v0.3.7_linux_amd64.tar.gz"
      sha256 "99d6d3c6f66464e49cf5c51a72b52dc72f4fb3b1821f45958b73e044254388e0"
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

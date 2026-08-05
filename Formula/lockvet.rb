# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.9/lockvet_v0.3.9_darwin_arm64.tar.gz"
      sha256 "1a015731c0f8a89941c7f4cf6f7456d61a6a7d328d859b54eea2d9c35764623a"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.9/lockvet_v0.3.9_darwin_amd64.tar.gz"
      sha256 "9803def6f2156f1020b679feec31673423b524b2ea63f94588d06636afdb5b58"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.9/lockvet_v0.3.9_linux_arm64.tar.gz"
      sha256 "a285f37d8c545753c48d6eb288db5a9ad2d98978ad3e5b54cf370d6312588c43"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.9/lockvet_v0.3.9_linux_amd64.tar.gz"
      sha256 "60d1693ae5289302abc613a9d2c060442e79abafc219938056bd7046bc9bbc8f"
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

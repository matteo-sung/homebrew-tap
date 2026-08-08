# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.11/lockvet_v0.5.11_darwin_arm64.tar.gz"
      sha256 "15b03f36762e92ecf3330c0f02bafb069345a11466419e01db7c86349c7487e8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.11/lockvet_v0.5.11_darwin_amd64.tar.gz"
      sha256 "4e8ee65facea442ba3ae608c6ed214e26960b802b8813dcd2fe72fd886fc36cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.11/lockvet_v0.5.11_linux_arm64.tar.gz"
      sha256 "a3d13b78ced0aeeb09b0d63bd78ed3c3b79e7e3161eaf05cc2fd79ad64683372"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.11/lockvet_v0.5.11_linux_amd64.tar.gz"
      sha256 "ced3b33b96a494eddaaa374923ef9cd30312dbc3bb4e73d6dea6d9c36857d5e4"
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

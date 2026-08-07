# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.4/lockvet_v0.4.4_darwin_arm64.tar.gz"
      sha256 "3390bfa1fff4a0e79cfc172ffb5fdf0fa96b99ea4aef81ff617618a7f509cbb2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.4/lockvet_v0.4.4_darwin_amd64.tar.gz"
      sha256 "5df792a52be56afed069c62e04d44f4cc172f9e9f5e85efe058c994a446c7276"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.4/lockvet_v0.4.4_linux_arm64.tar.gz"
      sha256 "6b0f639e9a410dc25f2f613e56590fcd7f4d9e8bacf9a1f3362e317ce21e2ac3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.4/lockvet_v0.4.4_linux_amd64.tar.gz"
      sha256 "1e99b3ebd0281653206ec75a73280040796b2e745f05d2f52288ea548aa9e91c"
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

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.31/lockvet_v0.5.31_darwin_arm64.tar.gz"
      sha256 "bd2adddcb565185cf592b15dde5a6622ba335e4849442038b8d169c7f768cbbd"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.31/lockvet_v0.5.31_darwin_amd64.tar.gz"
      sha256 "dba81634e718d8cbf7712783b57dc080c009aa2843d3d154dd3baf6d5cbff10f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.31/lockvet_v0.5.31_linux_arm64.tar.gz"
      sha256 "eb726e3518b8ed33abd60753b52d2e038e602798a4a280b0ea726e24a5465b2d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.31/lockvet_v0.5.31_linux_amd64.tar.gz"
      sha256 "a868361d2a2697430c3f09b2556f5c6470ed499ca28c4686f5909c6bdac732dc"
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

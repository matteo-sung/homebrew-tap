# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.13/lockvet_v0.6.13_darwin_arm64.tar.gz"
      sha256 "82072e473404099ae6b0f1efd49b9d401a1bf21ae79e13234952a96dc2987973"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.13/lockvet_v0.6.13_darwin_amd64.tar.gz"
      sha256 "26118aeaf9383809229039ab2ecd0ede4c74771ff2976ea3e6a5d1c47f2d9caf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.13/lockvet_v0.6.13_linux_arm64.tar.gz"
      sha256 "12a1485610ad36b7f4d9e4ea6ec6389708fbb110de2d830a9839e0e781ebadb1"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.13/lockvet_v0.6.13_linux_amd64.tar.gz"
      sha256 "168feb4afa34109928b318769347f5d60fdc4f1eef7c6c4e4f381c96f2175fc6"
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

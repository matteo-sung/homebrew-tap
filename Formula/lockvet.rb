# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.22/lockvet_v0.5.22_darwin_arm64.tar.gz"
      sha256 "a159c14f311a98faf5bacbf957804c1f9f3d9302b94ec7ccc960d85724d5078d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.22/lockvet_v0.5.22_darwin_amd64.tar.gz"
      sha256 "5c289b91eaf28bd97b9e9c20093bcd975ef1cac4d137a6c9c87668a77fab1152"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.22/lockvet_v0.5.22_linux_arm64.tar.gz"
      sha256 "636d1b32b15bbe5e430a46ed5566d824449f2de107298c6252b4948538baa4b9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.22/lockvet_v0.5.22_linux_amd64.tar.gz"
      sha256 "4118481147af83d8c104c320330768b612f6bffa7256d4080361308e3aa711d9"
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

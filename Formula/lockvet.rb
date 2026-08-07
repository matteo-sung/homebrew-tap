# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.4/lockvet_v0.5.4_darwin_arm64.tar.gz"
      sha256 "5cc51e15bb0ea8cc1c79be517fb2d69bef19d2add22be1e92b33b1985419dece"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.4/lockvet_v0.5.4_darwin_amd64.tar.gz"
      sha256 "cec4ce6775df0fb10034abc626f8f97ceac37cb5645a0c8832d6ef5d61a1365f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.4/lockvet_v0.5.4_linux_arm64.tar.gz"
      sha256 "f5ad63d932469567a8db6eb2687cf8f6ff2383c1466f4df3697728e9ab1913af"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.4/lockvet_v0.5.4_linux_amd64.tar.gz"
      sha256 "324b6c126d7cb3b1b862d39a711a0aa842b5b8b7f6ff8f045d698cb36a5466cc"
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

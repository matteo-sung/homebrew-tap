# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.20/lockvet_v0.6.20_darwin_arm64.tar.gz"
      sha256 "e926806526d4f33e0ddd6ac12adcf2165ede6e08c05d5842f5d06a358925bfd3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.20/lockvet_v0.6.20_darwin_amd64.tar.gz"
      sha256 "82fd57c6faa1d2268db096477bceb6aed258a20229137561ed40a59f2aa20f32"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.20/lockvet_v0.6.20_linux_arm64.tar.gz"
      sha256 "6b53366b49d8e88dde4225cc1aee72e6a18c9cd03c75d48fb2a222648024de86"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.20/lockvet_v0.6.20_linux_amd64.tar.gz"
      sha256 "d6ef5db16dfaaf200756061a412fad9805877ad96ee8b4b3b03225214b4f1427"
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

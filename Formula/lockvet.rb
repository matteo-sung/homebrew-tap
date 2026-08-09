# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.29/lockvet_v0.5.29_darwin_arm64.tar.gz"
      sha256 "da05a580560983f55457fa9fa7c7442b51eba35810b4bd690af50136823c1fd4"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.29/lockvet_v0.5.29_darwin_amd64.tar.gz"
      sha256 "eb114e94936b3c1696c84f26e4c0c17be8e15bc0c0715c9daa3d482bffa52aea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.29/lockvet_v0.5.29_linux_arm64.tar.gz"
      sha256 "923a060a1ff0129363e113ed3d17bd94b9593a25981a49c47c15e8ffceaa8909"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.29/lockvet_v0.5.29_linux_amd64.tar.gz"
      sha256 "588bd7d92047f666ba186b8d71a17f78a045061c7274223025ffc8f661b71921"
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

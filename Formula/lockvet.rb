# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.3/lockvet_v0.6.3_darwin_arm64.tar.gz"
      sha256 "fe390702d1245ff6966ccfd23992b7ef24afab41007695f71c211e00438ebf05"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.3/lockvet_v0.6.3_darwin_amd64.tar.gz"
      sha256 "d6feaeea04cbd5de2ca280869e0fed1d6f7ee41c3f887e083c3b5abe41533f5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.3/lockvet_v0.6.3_linux_arm64.tar.gz"
      sha256 "18680668184ab960fa8cf0e42accd96d49ceeea7a118f6dd73a12c1c68ee0ef8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.3/lockvet_v0.6.3_linux_amd64.tar.gz"
      sha256 "81124edd1e84d846ab00cea5b7702110c1e85ac5d73ca473bcd1e0e3aab70fa9"
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

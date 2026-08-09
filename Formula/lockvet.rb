# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.30/lockvet_v0.5.30_darwin_arm64.tar.gz"
      sha256 "a7d6c394d6ac9bb0b76e6894d785b403d59f1f62126ad867146ebc4cf7ea1802"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.30/lockvet_v0.5.30_darwin_amd64.tar.gz"
      sha256 "9ac0ebc6f50a8475db4a9c853441acdfa2c36c50b34c3142aff4371072a977f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.30/lockvet_v0.5.30_linux_arm64.tar.gz"
      sha256 "3ab9695add532f8ff27845abd5ebd711ec929b55a9b664c88ae11d0c60975f8a"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.30/lockvet_v0.5.30_linux_amd64.tar.gz"
      sha256 "f108231114d6152b0ae35146c5e40a58b7fec29a9c691391e8d09ebd862d571a"
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

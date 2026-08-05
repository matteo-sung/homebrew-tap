# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.16/lockvet_v0.3.16_darwin_arm64.tar.gz"
      sha256 "203a5b704cbeb9daf19339fad32428f7c15e1350537faca72fdeb103b5745d05"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.16/lockvet_v0.3.16_darwin_amd64.tar.gz"
      sha256 "fd48ae66bad6f1c850b9ca6c9f359a63304ee58b90892584ca4402cf02d871e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.16/lockvet_v0.3.16_linux_arm64.tar.gz"
      sha256 "6e47a7595170eda035df0d6a4263f7b7ab5be3e84e1b4da7e719eb2a3d761c21"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.16/lockvet_v0.3.16_linux_amd64.tar.gz"
      sha256 "066a03994e9ff33550814aa6a2fe3ac16adf5439a4f0a8b48154a4166070e17a"
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

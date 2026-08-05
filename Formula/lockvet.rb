# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.10/lockvet_v0.3.10_darwin_arm64.tar.gz"
      sha256 "ab839b2fa765f8d940e30e310007d232f04bbc0cd6fea9a197060c80024f9e3d"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.10/lockvet_v0.3.10_darwin_amd64.tar.gz"
      sha256 "204927b93c1095ec82eef927132b06039d7a2500d1cf1991ea49927236c09d50"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.10/lockvet_v0.3.10_linux_arm64.tar.gz"
      sha256 "2be0eebe24b37c8c1fdfc197cd59b306619753523c40a737578f5a45bd8a07e0"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.10/lockvet_v0.3.10_linux_amd64.tar.gz"
      sha256 "97e17aeccbf0cc8a19adb8d2ba6b3b1d07054a0854865737754115f524af9daa"
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

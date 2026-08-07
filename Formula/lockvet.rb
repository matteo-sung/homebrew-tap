# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.5/lockvet_v0.5.5_darwin_arm64.tar.gz"
      sha256 "bbe2092691e42ceaba52b5f2758430a76e7c8eb518700f54391a892af2d5a3fe"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.5/lockvet_v0.5.5_darwin_amd64.tar.gz"
      sha256 "fe1cc72962229964f820d980ba63a3de76f2158f45eae0881c627904948b0a62"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.5/lockvet_v0.5.5_linux_arm64.tar.gz"
      sha256 "ca9d0dce115a7f4d7d358636ce310286859c5e0cd50f08f7e424a2c7a7bcfb8f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.5/lockvet_v0.5.5_linux_amd64.tar.gz"
      sha256 "a5534e5b05ff1462b7fa6ac8d284499aa11d68406a172ce8fc4050ae12b3adbe"
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

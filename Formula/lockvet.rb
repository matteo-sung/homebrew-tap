# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.3/lockvet_v0.5.3_darwin_arm64.tar.gz"
      sha256 "a4f2a76f243509465293fa54f42bf8013cabb7b8d3357601384c65cb11f49b60"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.3/lockvet_v0.5.3_darwin_amd64.tar.gz"
      sha256 "9bfdf2d6f03c547059884d4a4f0add1d6770ffdc80c1a4adbe47c48e761a8364"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.3/lockvet_v0.5.3_linux_arm64.tar.gz"
      sha256 "7511dcab52c6fe9bce35f9d488ee751fc9be48d8baf9b3fbfbfeea4a22ef27f6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.3/lockvet_v0.5.3_linux_amd64.tar.gz"
      sha256 "4bff0862e2d4ae39a6d3f0853301e7052830bdcfd94d8313a5e65238471cd3c6"
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

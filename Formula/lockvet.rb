# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.8/lockvet_v0.4.8_darwin_arm64.tar.gz"
      sha256 "c4c00d4f3da76bc03772c47952fa8a24c6e8afba54c0cc4e4964834023c23671"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.8/lockvet_v0.4.8_darwin_amd64.tar.gz"
      sha256 "2ff0eea8d80267c4daf6755ae17b7e0c943c7a8965a05ee62f687587265c47bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.8/lockvet_v0.4.8_linux_arm64.tar.gz"
      sha256 "679f109fda0b43a8aa6e741892195777693d4fdd0c38ef970c48f187a40fd649"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.8/lockvet_v0.4.8_linux_amd64.tar.gz"
      sha256 "8ca261fcb5286d5d230c52c49178f1d74d56a4c12a47aec4627427bcfc630d3d"
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

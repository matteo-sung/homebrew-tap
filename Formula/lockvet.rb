# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.16/lockvet_v0.5.16_darwin_arm64.tar.gz"
      sha256 "20c66aa8448f1aa5b559628745991e2a7a37814266fac7e3e6212a17a0d9d879"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.16/lockvet_v0.5.16_darwin_amd64.tar.gz"
      sha256 "df4fdb6ef101f6a796b85baeaeae07db39ee48ba2341080ec0461c39ae059c3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.16/lockvet_v0.5.16_linux_arm64.tar.gz"
      sha256 "e1abdcfaa2970bd943bd8b1d697f0d3a095e76d1bc3e4f924ccbab11ee9c5dab"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.16/lockvet_v0.5.16_linux_amd64.tar.gz"
      sha256 "ea3aa30210d14c8607c73cad9e46bc7c4dfc84d27dbc6d0fb74b1c04228b3258"
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

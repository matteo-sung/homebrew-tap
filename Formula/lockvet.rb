# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.2/lockvet_v0.5.2_darwin_arm64.tar.gz"
      sha256 "3d88a6e45768763b26f942784e0b7372f51ad309f07c4961912a0ed872ea75e0"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.2/lockvet_v0.5.2_darwin_amd64.tar.gz"
      sha256 "8099b1c6706713671a6e7ccee3def4fb9efa592cceafa8ff2a1712a94945ca11"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.2/lockvet_v0.5.2_linux_arm64.tar.gz"
      sha256 "2b409fb2dced446394cec55ad9af417c7c00d47a4353f91502da404e47b6514b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.2/lockvet_v0.5.2_linux_amd64.tar.gz"
      sha256 "9f9aa3706f47f18c3673681b4f7822d6c3bdfa04210cf038355855bcd951947c"
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

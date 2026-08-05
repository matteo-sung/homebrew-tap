# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.6/lockvet_v0.3.6_darwin_arm64.tar.gz"
      sha256 "e8aa46373df86b875c1b497a880364c328f457242d221db280e9b3ca996ce76c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.6/lockvet_v0.3.6_darwin_amd64.tar.gz"
      sha256 "f61e160e8981b2ddf23eb6c1c3a6979b9aa109c161fee50815b0a1943d83d988"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.6/lockvet_v0.3.6_linux_arm64.tar.gz"
      sha256 "86804ec4f74d08a5de6522d9424b33a7d2553f3e1a088a4b6c5c3a9ebe4310f7"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.6/lockvet_v0.3.6_linux_amd64.tar.gz"
      sha256 "52eb465426a5a0e4762aee4135345582c53123f35802b32f87562f99ee1a0ba9"
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

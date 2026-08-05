# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.14/lockvet_v0.3.14_darwin_arm64.tar.gz"
      sha256 "9511d429e347b5023ac1edfcfdd2f84b9f303c8cd96d0bc7ee79340318846eb5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.14/lockvet_v0.3.14_darwin_amd64.tar.gz"
      sha256 "b30082c30c1109ced943fdc84cd06d89758ad780dec4a31bf4992810ab11640a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.14/lockvet_v0.3.14_linux_arm64.tar.gz"
      sha256 "379cd6dc54e49d1d12690d42e605acc4e488f4274dc75b805dea1bc072182500"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.14/lockvet_v0.3.14_linux_amd64.tar.gz"
      sha256 "9abe20674215afc18b87899a0d065b4273a4346bfcb8e8a703d82e2c74d83453"
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

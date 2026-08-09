# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.24/lockvet_v0.5.24_darwin_arm64.tar.gz"
      sha256 "376963fdc67bbe7235fdb612ee7578f8938183800699478d1d31b1e07353732f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.24/lockvet_v0.5.24_darwin_amd64.tar.gz"
      sha256 "c6a416fe42f56e44b877e603add334818ee2f24db9c555d7fb46ffc3de948b54"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.24/lockvet_v0.5.24_linux_arm64.tar.gz"
      sha256 "e036f100f49d5867627b6c7c1796891a425c491a234aa73823f8acd72ef0c1b7"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.24/lockvet_v0.5.24_linux_amd64.tar.gz"
      sha256 "91d832d151c1cbfd087c7e7b30f132fa7ec6aac322b28b2ed77f591a8624789d"
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

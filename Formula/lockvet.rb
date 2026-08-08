# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.21/lockvet_v0.5.21_darwin_arm64.tar.gz"
      sha256 "e015de5686624ac2e2d2952a563baf9d983f146c74c58c1b37966abde48e96ef"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.21/lockvet_v0.5.21_darwin_amd64.tar.gz"
      sha256 "42f52139a933d11e248468106c947d31a20c2e2ef0102c4aae3478b46e7026dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.21/lockvet_v0.5.21_linux_arm64.tar.gz"
      sha256 "849367426edb1c5523dcf3809048c007bb959df529ed60d7328a670ca94f8a34"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.21/lockvet_v0.5.21_linux_amd64.tar.gz"
      sha256 "f78362ff3ea15d97e630490422ae849e60366abfd27b23591a7a1d78ca80412f"
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

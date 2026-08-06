# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.2/lockvet_v0.4.2_darwin_arm64.tar.gz"
      sha256 "8e1dd0547dc495fe263e53df4257433494916d8ec9c65d3e5d85fa9bc6c51758"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.2/lockvet_v0.4.2_darwin_amd64.tar.gz"
      sha256 "fb25b44166d5cbb2462e020fec067671dd3fb87d6c58ed830ee73db6fd1bf5bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.2/lockvet_v0.4.2_linux_arm64.tar.gz"
      sha256 "f041d5715054c2a43db88ce9a6b06001c5ff9996c8103317d4da8e7b3ebe0995"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.2/lockvet_v0.4.2_linux_amd64.tar.gz"
      sha256 "aee825d58176d1272ff0b8d0559a7d3044b1fbfb8379e36e509762ea6bf2b68c"
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

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.18/lockvet_v0.6.18_darwin_arm64.tar.gz"
      sha256 "6b5a372b8dd302a72f360e48850b555be8354f08e5ad7ee312dd19a7c38cebac"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.18/lockvet_v0.6.18_darwin_amd64.tar.gz"
      sha256 "1b9b4c1f371fefb3580da8f720d7da1a871bdd3c221e975a71e93caae02a253e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.18/lockvet_v0.6.18_linux_arm64.tar.gz"
      sha256 "b7fc604eb8014a5b428a26d99ba07fa1ca6f96246edf5b39351c3c1ebe91a1e5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.18/lockvet_v0.6.18_linux_amd64.tar.gz"
      sha256 "95ab9c3aa426da54bf5236b6d9fa1141227a5ec9979ecdd46e6581080bfcd7c8"
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

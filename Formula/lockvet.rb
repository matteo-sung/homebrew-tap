# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.13/lockvet_v0.3.13_darwin_arm64.tar.gz"
      sha256 "70b1c6986540b636f92958e617d276b53cb512f930210b12a6b55e016c17605b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.13/lockvet_v0.3.13_darwin_amd64.tar.gz"
      sha256 "0ef2451371fb264b8da514fdbeeba2c71f27c68ab64e7589540d4ab33d584c88"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.13/lockvet_v0.3.13_linux_arm64.tar.gz"
      sha256 "b9d8b26f45799ed9a9da712275351c67dc6bf9b45685c4598fe7c7daa0beb3d4"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.13/lockvet_v0.3.13_linux_amd64.tar.gz"
      sha256 "b0b9612297dd5062def602ff97a3a7355692d367437659648058ec594edc8902"
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

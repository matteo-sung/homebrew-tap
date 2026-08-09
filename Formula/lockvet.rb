# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.0/lockvet_v0.6.0_darwin_arm64.tar.gz"
      sha256 "6f342d322105df3d0dc3f37452f10141dddce987c9f1dbcfe4d5ba784e518e06"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.0/lockvet_v0.6.0_darwin_amd64.tar.gz"
      sha256 "c7d834c6039268ba700f69fe09862248c1036a31363f99546ab9cd77481004b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.0/lockvet_v0.6.0_linux_arm64.tar.gz"
      sha256 "f67ccf6423346de68e184ed7134163deffd88765d158790fdb602399b67c871f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.0/lockvet_v0.6.0_linux_amd64.tar.gz"
      sha256 "40f81b4013abd601103fc1b063e2aa55eb4d9fde0a7de8e2db098d90dbab70ed"
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

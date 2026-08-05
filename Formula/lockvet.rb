# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.5/lockvet_v0.3.5_darwin_arm64.tar.gz"
      sha256 "9ab81a452bf52ef62251b377c0c82b6b45e3fc71dec26acca38d6874b4871caa"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.5/lockvet_v0.3.5_darwin_amd64.tar.gz"
      sha256 "a9ab4fd49de04751dd209eb80ad92df5c6e8dc4b7049b194c6348cd14b3e7ecb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.5/lockvet_v0.3.5_linux_arm64.tar.gz"
      sha256 "db980a3e1acd04bd0ff2d18406b57508b24da57c24d21797ba015a37c1eb4c87"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.5/lockvet_v0.3.5_linux_amd64.tar.gz"
      sha256 "53b555d97e43e534f194b9aaf913f017724394db893af712f5171badb2feb71b"
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

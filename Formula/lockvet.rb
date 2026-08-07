# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.5/lockvet_v0.4.5_darwin_arm64.tar.gz"
      sha256 "04945fa7788e15ba3fd535622c472bba88f007ca717025a430b853e80170b516"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.5/lockvet_v0.4.5_darwin_amd64.tar.gz"
      sha256 "be396acb679d8757e782195fcd4aeb26eb8696c0c30d3013a79985b1a389d7a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.5/lockvet_v0.4.5_linux_arm64.tar.gz"
      sha256 "afb06ddc2a4daca08f65f51be0c5996f6fd0556098a5830bb70082e6185aa771"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.5/lockvet_v0.4.5_linux_amd64.tar.gz"
      sha256 "7327c55cc07ea0fa0ef09fab377bc6878371fd31c9759df174ddc6198f5f7aa5"
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

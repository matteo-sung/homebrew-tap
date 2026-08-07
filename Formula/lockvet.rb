# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.1/lockvet_v0.5.1_darwin_arm64.tar.gz"
      sha256 "ef05e7004747b790bcdad8fcf9f5b98d9fc1b4ceb21e313d98ef6422c81773b8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.1/lockvet_v0.5.1_darwin_amd64.tar.gz"
      sha256 "48c615af283282ca8cc277de360e520d2c4c95cf405b41855d485435086cac65"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.1/lockvet_v0.5.1_linux_arm64.tar.gz"
      sha256 "c0ebe94869fd30d9e88918b716278c7d777fd2c5de002cf063385c6b841ae37b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.1/lockvet_v0.5.1_linux_amd64.tar.gz"
      sha256 "2d83d951cd80828520abd5562c520569afb888c61949c3797e37a4015c1dd580"
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

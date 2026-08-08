# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.14/lockvet_v0.5.14_darwin_arm64.tar.gz"
      sha256 "4663816a7639413e5fb7219cfd417911f1dc935032b601b985ddcfc5d6fd12cf"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.14/lockvet_v0.5.14_darwin_amd64.tar.gz"
      sha256 "0dd1d6f14bf33549e747ed326c2f61225a56595037359ee463978d9d1a6d929a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.14/lockvet_v0.5.14_linux_arm64.tar.gz"
      sha256 "eff02f51ede47cf54364d711673a092e2d5fc88a4eb31b6f8e59167b59bc7743"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.14/lockvet_v0.5.14_linux_amd64.tar.gz"
      sha256 "28fd48949439e2588397544ce4cdac5694892ab53252cda1519cc51fbed71089"
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

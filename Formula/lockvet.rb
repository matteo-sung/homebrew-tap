# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.19/lockvet_v0.3.19_darwin_arm64.tar.gz"
      sha256 "f998c210c9cfd31673d73cfb0016766eee02add9b0c1ea6b68129fb4e453c612"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.19/lockvet_v0.3.19_darwin_amd64.tar.gz"
      sha256 "a0e97e294890ff5580a73b225a3238ff69c569c1439e2c6a08ac09918f3f254d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.19/lockvet_v0.3.19_linux_arm64.tar.gz"
      sha256 "efcddacb9a1b9304eadfac5b9568ef763b0ca814569427564f0e4b8a7dd08e80"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.19/lockvet_v0.3.19_linux_amd64.tar.gz"
      sha256 "a7669e3081a9ede67d41ee067298cc6874d1efe3de9a9cf9b1c8796ac735f6de"
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

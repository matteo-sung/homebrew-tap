# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.7/lockvet_v0.6.7_darwin_arm64.tar.gz"
      sha256 "f8d09b708206c0e0b68e19c842e7a80b0a369bd8a55ac2b857d83ddc1036eca7"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.7/lockvet_v0.6.7_darwin_amd64.tar.gz"
      sha256 "6f8ec75453c9be268a7128da35ea6a30642fc787b9beb601929645ac96a36501"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.7/lockvet_v0.6.7_linux_arm64.tar.gz"
      sha256 "57498b4c022730af5e024fd4ac6cf134032771a354a5cf9cfdaa9d05cff163a2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.7/lockvet_v0.6.7_linux_amd64.tar.gz"
      sha256 "254da5e647acc1df3bcf5656b830e77cfaa1c10177a4608e9c78266136917f90"
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

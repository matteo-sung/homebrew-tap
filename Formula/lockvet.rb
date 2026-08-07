# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.0/lockvet_v0.5.0_darwin_arm64.tar.gz"
      sha256 "87d6e18328cb71c4862d1da33d0fb6341dbe21ddad53f67b7a1b809bd4f790f3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.0/lockvet_v0.5.0_darwin_amd64.tar.gz"
      sha256 "4dde27db495c54f9dd5aeded1dbcec4c510a8ae365104622d13fa9dafd9daede"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.0/lockvet_v0.5.0_linux_arm64.tar.gz"
      sha256 "830ea4985fc62d972ddb50f7b40d608d00384c2c81789eee022f8dcbc2db4c7a"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.0/lockvet_v0.5.0_linux_amd64.tar.gz"
      sha256 "9675220e7285e24c85eb9534771e3bf39dca3a23c14da17b867ef6e139c71fc0"
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

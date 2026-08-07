# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.9/lockvet_v0.5.9_darwin_arm64.tar.gz"
      sha256 "82379e195fb7fd0748f6ca904e44fc00e1c922e3ed8f1370f52a87abfde4e26f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.9/lockvet_v0.5.9_darwin_amd64.tar.gz"
      sha256 "f34c57a0e5a571a3c90bba9b5c7f1b56bc7929d1534fa2e6bf73b3f958df878a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.9/lockvet_v0.5.9_linux_arm64.tar.gz"
      sha256 "a38e88264219afb991a30ead4d992add450b14ef12ae3a81f49315dc792d135a"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.9/lockvet_v0.5.9_linux_amd64.tar.gz"
      sha256 "c9cc9cb051a5b98d2ec5f247635adf09031db911d99f7e3631b4fd2eb368c42b"
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

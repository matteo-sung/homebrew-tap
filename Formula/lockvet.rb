# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.7/lockvet_v0.5.7_darwin_arm64.tar.gz"
      sha256 "e995263c3d50ddfb3082e8d034e7d2403c7878de5413d556d33c50f9b0c08ac9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.7/lockvet_v0.5.7_darwin_amd64.tar.gz"
      sha256 "be4c1081ed56c36c171860422c442b18682e75e6d7074d79cb9c6b347c026b16"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.7/lockvet_v0.5.7_linux_arm64.tar.gz"
      sha256 "20477bdfd6d9addbf70172837abc083f5b294dd4aed0064040959f52c8c35065"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.7/lockvet_v0.5.7_linux_amd64.tar.gz"
      sha256 "1e4f6851e7f1737f769ba078c62a6e6c626c6b4af6ada30a29a19306eebab1e8"
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

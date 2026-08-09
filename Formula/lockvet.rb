# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.1/lockvet_v0.6.1_darwin_arm64.tar.gz"
      sha256 "1b8c9d049638ce43f34789b65f15a5c26c4e5ea68b883b498a7b7ebfd7a0e6f2"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.1/lockvet_v0.6.1_darwin_amd64.tar.gz"
      sha256 "73fc0a169843cd3411029ec6212f6ee0fc2b27ae33edacd3ee4aaa7f04622d9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.1/lockvet_v0.6.1_linux_arm64.tar.gz"
      sha256 "14ff5130f62940d145cbc5cd1174050592bcd588b41d605b6b703cc5e94ee32b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.1/lockvet_v0.6.1_linux_amd64.tar.gz"
      sha256 "3a60e517fa7645ca3612071b787fce9149ca47a918d7f9cc918715b643ef38e7"
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

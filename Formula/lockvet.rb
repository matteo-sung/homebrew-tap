# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.18/lockvet_v0.5.18_darwin_arm64.tar.gz"
      sha256 "37cd1ee4e0b749213d5f42ad762108e4e64b2d300a6041e5bcb5b4f8fd32f523"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.18/lockvet_v0.5.18_darwin_amd64.tar.gz"
      sha256 "d2010fad53bf1001ea044531b6cc24d72b8374b533275004262ba2bf67798e90"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.18/lockvet_v0.5.18_linux_arm64.tar.gz"
      sha256 "ac209823361b4371b5c7f9a7a5b17a3e50fdb5d63e857be0b28be788700ae4fe"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.18/lockvet_v0.5.18_linux_amd64.tar.gz"
      sha256 "3c2b93c455db5b5ee8ead0baa8782d82700283b4917061a95b06216d5c8188fc"
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

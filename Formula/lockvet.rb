# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.6/lockvet_v0.4.6_darwin_arm64.tar.gz"
      sha256 "a163ba3c11c825d27bb4f7dbf3c81149bfe45c3ae02b1c62b84f539bef82ec7f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.6/lockvet_v0.4.6_darwin_amd64.tar.gz"
      sha256 "fe7151384e1e9f9223e68bbb28fc66bde0726ab0499ad27174fadd039fb23cef"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.6/lockvet_v0.4.6_linux_arm64.tar.gz"
      sha256 "057e7b3b89d63d8dad589c37dab081baa2b15e7c87362d039eb08997a4957ba5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.6/lockvet_v0.4.6_linux_amd64.tar.gz"
      sha256 "7ba9f71422e922163a9cd21306dfad8104eaa58c195bef77f46200e2c35ca155"
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

# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.2/lockvet_v0.2.2_darwin_arm64.tar.gz"
      sha256 "0d7f1e83fb7a544b177d4bfb026159777320f62d950fa90b0d27c51cdab186f9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.2/lockvet_v0.2.2_darwin_amd64.tar.gz"
      sha256 "9389945484ccc40ab8785ea35dd4eefc162298500008b3177d95a7dec5396734"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.2/lockvet_v0.2.2_linux_arm64.tar.gz"
      sha256 "ef2b6af37f6df966becab39110576b896ef2f93001eb9fd7ea9c22d21ebe1d7c"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.2/lockvet_v0.2.2_linux_amd64.tar.gz"
      sha256 "0422370b87b727a1496a393258cc36c8cb70c9783dfa2aeb7c46cefb1451efc7"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

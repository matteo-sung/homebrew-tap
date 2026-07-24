# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.10/lockvet_v0.1.10_darwin_arm64.tar.gz"
      sha256 "5da584d5250d97d02e521829f00a323c9fd3759382f3a449bbdc794d49afd4d1"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.10/lockvet_v0.1.10_darwin_amd64.tar.gz"
      sha256 "dd244806bf0acf9cec49b40554efac16c86e76a3de21b026b981da272981def8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.10/lockvet_v0.1.10_linux_arm64.tar.gz"
      sha256 "19b5c808a607ab49dfe55d6d3680f277ac161b6f3b07631a69a0514b89dfec85"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.10/lockvet_v0.1.10_linux_amd64.tar.gz"
      sha256 "1b4173a246e0675e7eb8fb58f875c168546cfb5ff37f3453e258df93a0937875"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

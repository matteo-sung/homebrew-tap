# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.4/lockvet_v0.1.4_darwin_arm64.tar.gz"
      sha256 "6903639c1d9989561f0b6b26726a4340720a5277e623573ab8d360e519ef9f38"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.4/lockvet_v0.1.4_darwin_amd64.tar.gz"
      sha256 "1490584c3e6907a940e6cc9e8861b86b41c805d7d0f4fedd8691b121bb76aa0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.4/lockvet_v0.1.4_linux_arm64.tar.gz"
      sha256 "f1d6eba774f07fcf995e5eecae44133847d986a289df3ac3b04262cbeacf27df"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.4/lockvet_v0.1.4_linux_amd64.tar.gz"
      sha256 "8264ab190093aec9fed540bc5721916ac4d1ab8b0a6029f79ed66f6e3971d233"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

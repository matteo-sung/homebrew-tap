# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.16/lockvet_v0.6.16_darwin_arm64.tar.gz"
      sha256 "09f8865885a7e45b0b2a64ffa19c8c645b12b7b00746651ef9c105a07322d3e6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.16/lockvet_v0.6.16_darwin_amd64.tar.gz"
      sha256 "4e626d5f6d3a0ee7dc5abeb23d8e91d51b5883d5a1fe7eb79a9fc16067515c64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.16/lockvet_v0.6.16_linux_arm64.tar.gz"
      sha256 "8f1204b820d8044974b6fa490526b5e4f76837ac3c0fa4d22a20b14d23d3b031"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.16/lockvet_v0.6.16_linux_amd64.tar.gz"
      sha256 "68551eeef6108197a7079dc4b26b4abeed05576a5b7188fe16e58aeade038935"
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

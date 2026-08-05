# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.3/lockvet_v0.3.3_darwin_arm64.tar.gz"
      sha256 "e95882376654ac81e22a54590f7b88f726312abe2b98bba87be66b71a11a387e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.3/lockvet_v0.3.3_darwin_amd64.tar.gz"
      sha256 "aedf5e3dad0fd7a5fbea49834f4d9ce8825bb20e7920c359b694b64d3367ec3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.3/lockvet_v0.3.3_linux_arm64.tar.gz"
      sha256 "9751c800a612b0f0d01b4bfb2dd2276e9e99d92e126fb5a18e5c7126f0416919"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.3/lockvet_v0.3.3_linux_amd64.tar.gz"
      sha256 "deccdf58fad2e3c16d25cec39f2c6ccd185b6abf68e7c7a12f1216b39fa4d53d"
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

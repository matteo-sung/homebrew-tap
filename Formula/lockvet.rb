# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.2/lockvet_v0.6.2_darwin_arm64.tar.gz"
      sha256 "ba5ce0c4baa18a97fb65f7051012660d18bdc1deb54646c511664dde81af6dab"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.2/lockvet_v0.6.2_darwin_amd64.tar.gz"
      sha256 "03e739ad1793f34d1d57172c30c39dda21595afa58dcc85ae6e0056092175797"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.2/lockvet_v0.6.2_linux_arm64.tar.gz"
      sha256 "d65e2c2a95ca77df9688043283e1a9fc51d4c3f729700e89c760cdddb4089b57"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.2/lockvet_v0.6.2_linux_amd64.tar.gz"
      sha256 "e522aa911d5899c526e4775e5508c2ba9bf94ccd6f8ba31be7b9534c12843a10"
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

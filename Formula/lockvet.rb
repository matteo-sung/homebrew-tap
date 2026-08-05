# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.4/lockvet_v0.3.4_darwin_arm64.tar.gz"
      sha256 "72f1107ec36f50aee58ce95fd7bc3e9f480c692a737a32730bba8d688bcd6fe9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.4/lockvet_v0.3.4_darwin_amd64.tar.gz"
      sha256 "60bb7bab47ec7fa4ec997809e949f7cc2a22882482f06fbd9d524ee113706134"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.4/lockvet_v0.3.4_linux_arm64.tar.gz"
      sha256 "e5d01388b20adbd6a4c77bf35d32d482a346dc8fc2e9b28446c5502ef4146f83"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.4/lockvet_v0.3.4_linux_amd64.tar.gz"
      sha256 "86bc4f2f5f6d749f9542c82129a6000a7be587eb8acb5dbbb95de0c8b3a23099"
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

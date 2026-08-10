# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.4/lockvet_v0.6.4_darwin_arm64.tar.gz"
      sha256 "de82d2b5a79e35c7fff2d043ce59e73690c5310a3fe08441ba4078706d2f11b5"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.4/lockvet_v0.6.4_darwin_amd64.tar.gz"
      sha256 "68e37432ae9dceffb33b09899506fafbf05b171182efb14078dc0b3f38a643ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.4/lockvet_v0.6.4_linux_arm64.tar.gz"
      sha256 "25465475b787dd17eeb786f9ba02f659b8a5e59348158589bddd0876cd3df519"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.4/lockvet_v0.6.4_linux_amd64.tar.gz"
      sha256 "09de3a4a2bf18b9368e9c07f6c59e45583e8ccdfc8ac4023c7096f181e516b31"
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

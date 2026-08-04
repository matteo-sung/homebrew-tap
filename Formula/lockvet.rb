# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.1/lockvet_v0.3.1_darwin_arm64.tar.gz"
      sha256 "4c8fd6b497bba93f93eac4a09b2deae2a8316f23ca2a02022f35e03abac84ddd"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.1/lockvet_v0.3.1_darwin_amd64.tar.gz"
      sha256 "2687634bd9d08d9f13f22bceb960686d032102e574246dc77b761f14cf207928"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.1/lockvet_v0.3.1_linux_arm64.tar.gz"
      sha256 "19008ecceb5e18ce2fa69c14c0532004c5e3f5d93f3a01b2c6154983ca573c7f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.1/lockvet_v0.3.1_linux_amd64.tar.gz"
      sha256 "ba0e7bc830fde7fe1983d7f50ad7d38131bc1ba74f904d24e7b9d8ed83528fa0"
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

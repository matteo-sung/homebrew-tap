# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.15/lockvet_v0.3.15_darwin_arm64.tar.gz"
      sha256 "e7ca8c047fa198dfd757a30de6f2c1a32858bc086210e835f03884addb170079"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.15/lockvet_v0.3.15_darwin_amd64.tar.gz"
      sha256 "14325e7816c5537d116d8119ae113fae0252935fb7ffd8e0339758ed3089b459"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.15/lockvet_v0.3.15_linux_arm64.tar.gz"
      sha256 "523210de85a8d692767abddc060ee7f0a4102fa224766f3fda707e31583ef29b"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.15/lockvet_v0.3.15_linux_amd64.tar.gz"
      sha256 "23d868cabd97547bbf68e8cbb034ee3ad3274df3f64299aff3e594592015361c"
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

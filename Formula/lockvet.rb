# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.19/lockvet_v0.6.19_darwin_arm64.tar.gz"
      sha256 "2119e47d37b487c1bf350ae692762d79f46b4373738dd151ecde7c95325d82bd"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.19/lockvet_v0.6.19_darwin_amd64.tar.gz"
      sha256 "4d84fbf976338fe277c3e3858494840a091fc6a6f912e46a8f041d06af8d3988"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.19/lockvet_v0.6.19_linux_arm64.tar.gz"
      sha256 "b1b59f24275c1498b01e8047d492d77bca3054db1fad176b6b67c0840bad65c9"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.19/lockvet_v0.6.19_linux_amd64.tar.gz"
      sha256 "adaa666994f9f307d6b69905d8e453a990c857aaa7bbc871cf8831bbf586e71f"
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

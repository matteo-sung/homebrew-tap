# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.3/lockvet_v0.4.3_darwin_arm64.tar.gz"
      sha256 "6c995000cd57ede75c749f64388aa10d5f3c7d9c30a305fe939442ef7627c675"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.3/lockvet_v0.4.3_darwin_amd64.tar.gz"
      sha256 "bce2d25ad94d15ddd0042ea4c168219c9d694fac86878bdd2513064f36982fdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.3/lockvet_v0.4.3_linux_arm64.tar.gz"
      sha256 "715707d21b790556b6c8a5e8c0175f44a98846489d6fe665f4444e7db6e23c83"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.3/lockvet_v0.4.3_linux_amd64.tar.gz"
      sha256 "0da51efbe1b4a4efc1e497cc0b7abb6fd660699101a01e19d5eb48cb4b455425"
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

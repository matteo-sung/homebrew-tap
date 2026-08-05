# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.0/lockvet_v0.4.0_darwin_arm64.tar.gz"
      sha256 "40fba60f7204fda957cbce032c2cf7ea3e9f6665f9a1cac0409c2f79f7d8a748"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.0/lockvet_v0.4.0_darwin_amd64.tar.gz"
      sha256 "f6e348537447968497b9fb55aef0de5c95f76022891d9ae21e61b4b8c2f6a6ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.0/lockvet_v0.4.0_linux_arm64.tar.gz"
      sha256 "326d79ac7f8ef8930f3d2215de5c098f6ba2bf10cfc587ba745cb710f883243f"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.4.0/lockvet_v0.4.0_linux_amd64.tar.gz"
      sha256 "a9df2764b48ec77e1c9735d87358e79edc4c122d376c58255dad869a32594dbf"
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

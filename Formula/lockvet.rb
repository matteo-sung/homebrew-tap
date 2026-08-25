# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.5/lockvet_v0.6.5_darwin_arm64.tar.gz"
      sha256 "552e54a9593dc3495f66a5662f76f6f01dfd72774a1ea3e606ef6f747a123171"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.5/lockvet_v0.6.5_darwin_amd64.tar.gz"
      sha256 "640d46a5aace17daa5d4d36f792bef6cc089b0b438e38dad5e31218a3d50b200"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.5/lockvet_v0.6.5_linux_arm64.tar.gz"
      sha256 "2871d947983e6109320b6dd8af592e400b50f0ae2293f87b02210ec0a315456a"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.6.5/lockvet_v0.6.5_linux_amd64.tar.gz"
      sha256 "d0ea82696818b45979b4c011cd406fb75cd5413d7cf732abb5e518b95978bb5e"
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

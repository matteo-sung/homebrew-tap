# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.11/lockvet_v0.3.11_darwin_arm64.tar.gz"
      sha256 "620e5ac26b3589b2c1f7fe65d13288b05111f7c79ca88e3febf5a4f665fcd6b6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.11/lockvet_v0.3.11_darwin_amd64.tar.gz"
      sha256 "6ef42eb28c752d31038e635413a64a7d4f6e3c701260b0ea8de994071fa750cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.11/lockvet_v0.3.11_linux_arm64.tar.gz"
      sha256 "8fd4aab0276af5271e8d766d5041162351cb0ba5c4ee87258d3f4709cde7bec3"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.3.11/lockvet_v0.3.11_linux_amd64.tar.gz"
      sha256 "43393596bf4164fcbe758c51a8de04d4622ffe20adc5e450be8ded119900eb03"
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

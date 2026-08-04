# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.4/lockvet_v0.2.4_darwin_arm64.tar.gz"
      sha256 "e7304a4e026a5d6c4a21b2635336f60b35a260618076abdca4f13600a3d0c717"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.4/lockvet_v0.2.4_darwin_amd64.tar.gz"
      sha256 "37886c2bdb8779e915090c5f9633375014838c07dc95a5e4cdbab9a27c833a54"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.4/lockvet_v0.2.4_linux_arm64.tar.gz"
      sha256 "2274ea92a9fad02681c4ed164797808f9a8de84bb180d658cfefc103c655409e"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.4/lockvet_v0.2.4_linux_amd64.tar.gz"
      sha256 "f4748ae53bda3744e6108612710917419f5e5d214f6dd3fcf31b91c5a958126e"
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

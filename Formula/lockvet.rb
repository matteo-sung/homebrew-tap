# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.0/lockvet_v0.2.0_darwin_arm64.tar.gz"
      sha256 "66b93f6c08ebc6f22b971322aab7e596f4073ecbaf3a106c72fcd39065f890f8"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.0/lockvet_v0.2.0_darwin_amd64.tar.gz"
      sha256 "30ee69c51de03db76f8c4d4020f4c02b7520f0173cc87a832c15bca6122c4336"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.0/lockvet_v0.2.0_linux_arm64.tar.gz"
      sha256 "c67fef968eeb7bd487eaf4ba18f19e35138ecf4a79d6bbfe7e1e1a6ae77f8830"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.2.0/lockvet_v0.2.0_linux_amd64.tar.gz"
      sha256 "d1f7f97187cc3f65835fd0a4b7ff861fb50ea56eac90bd99c524e4bf70b11210"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

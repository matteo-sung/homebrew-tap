# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.12/lockvet_v0.1.12_darwin_arm64.tar.gz"
      sha256 "42618aa2a39acb4ca000a5c99f5cb4d2690ad16a4b74212937d3c841be246c92"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.12/lockvet_v0.1.12_darwin_amd64.tar.gz"
      sha256 "9ea3bfbe7aaeb69e2822dba7756ed0147eeaca13a7a21ab7ce6767312edcb6c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.12/lockvet_v0.1.12_linux_arm64.tar.gz"
      sha256 "c65de3edb697144cbeed9895a4b5a1b72aa9b01f86820fe75dc7ac96082b4525"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.1.12/lockvet_v0.1.12_linux_amd64.tar.gz"
      sha256 "e28719b41c11847e5c9c5b4fc45b79e805f9fc197c8a92a9623a6a1f4feae400"
    end
  end

  def install
    bin.install "lockvet"
  end

  test do
    assert_match "lockvet v#{version}", shell_output("#{bin}/lockvet -version")
  end
end

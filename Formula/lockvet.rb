# typed: false
# frozen_string_literal: true

# This formula installs prebuilt lockvet binaries from GitHub releases.
# Regenerated per release by scripts/update-formula.sh in this repo.
class Lockvet < Formula
  desc "Explain any lockfile change: bumps, vulns, release ages, deprecations"
  homepage "https://github.com/matteo-sung/lockvet"
  version "0.5.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.17/lockvet_v0.5.17_darwin_arm64.tar.gz"
      sha256 "d5ba530fa247130938c225fdc1e40c39aa8f385fbbbbf00a22932753d72d9bf6"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.17/lockvet_v0.5.17_darwin_amd64.tar.gz"
      sha256 "f802e4b9c23f3f83a4977c6f578fcdcaf1eccd5b40f5cc3025fc160bf75b9889"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.17/lockvet_v0.5.17_linux_arm64.tar.gz"
      sha256 "1e44c1525fe027c4ee01e3f1455cbfcd574c25c25f0303dc780828b79f183b20"
    else
      url "https://github.com/matteo-sung/lockvet/releases/download/v0.5.17/lockvet_v0.5.17_linux_amd64.tar.gz"
      sha256 "229a64ef6e1f8df5760cd950391a8f31e9b3f4a43c5e1c33239992a0eaf41ce1"
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

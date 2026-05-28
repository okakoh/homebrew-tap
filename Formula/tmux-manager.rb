class TmuxManager < Formula
  desc "Go TUI for starting, re-entering, and rebuilding tmux workspaces"
  homepage "https://github.com/okakoh/tmux-manager"
  url "https://github.com/okakoh/tmux-manager/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3f6cd59a0694de910493bb295da44a10c6577b447289d68e372736d05f19473a"
  license "MIT"
  head "https://github.com/okakoh/tmux-manager.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(
      ldflags: "-s -w -X main.version=#{version}",
    ), "./cmd/tmux-manager"
  end

  def caveats
    <<~EOS
      tmux-manager uses the tmux executable already available in your shell.
      This formula intentionally does not install or upgrade Homebrew's tmux formula,
      so existing tmux servers are not disturbed during tmux-manager installation.

      If tmux-manager cannot find the tmux you want, set tmux_binary in:
        ~/.config/tmux-manager/config.yaml

      Example:
        tmux_binary: /opt/homebrew/Cellar/tmux/3.5a/bin/tmux
    EOS
  end

  test do
    assert_match "tmux-manager #{version}", shell_output("#{bin}/tmux-manager -version")
  end
end

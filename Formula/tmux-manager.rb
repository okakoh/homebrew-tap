class TmuxManager < Formula
  desc "Go TUI for starting, re-entering, and rebuilding tmux workspaces"
  homepage "https://github.com/okakoh/tmux-manager"
  url "https://github.com/okakoh/tmux-manager/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6c5072f2884fcc21e203db708365f6922d713a851cb82800b95629ff39e236d8"
  license "MIT"
  head "https://github.com/okakoh/tmux-manager.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(
      ldflags: "-s -w -X main.version=#{version}",
    ), "./cmd/tmux-manager"
  end

  test do
    assert_match "tmux-manager #{version}", shell_output("#{bin}/tmux-manager -version")
  end
end

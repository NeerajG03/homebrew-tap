class Gig < Formula
  desc "Lightweight task management CLI backed by SQLite"
  homepage "https://github.com/NeerajG03/gig"
  url "https://github.com/NeerajG03/gig/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "33773e59d5c1bf267bc68232581935ced2374669247b1345b966cc6aebad0c1e"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/gig/"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gig --version")
    assert_match "Initialized", shell_output("#{bin}/gig init --prefix test 2>&1", 0)
  end
end

class Gig < Formula
  desc "Lightweight task management CLI backed by SQLite"
  homepage "https://github.com/NeerajG03/gig"
  url "https://github.com/NeerajG03/gig/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "f138de11f246a8cf20450af02ebc1b1755fa0db8340b43299a4997e7fe448d0f"
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

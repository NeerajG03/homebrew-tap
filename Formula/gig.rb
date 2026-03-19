class Gig < Formula
  desc "Lightweight task management CLI backed by SQLite"
  homepage "https://github.com/NeerajG03/gig"
  url "https://github.com/NeerajG03/gig/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "9148da2332a8fc2c95b61826383e63bea0e6389ef4a0420c3b89010ab7e8dd69"
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

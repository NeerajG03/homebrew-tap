class Gig < Formula
  desc "Lightweight task management CLI backed by SQLite"
  homepage "https://github.com/NeerajG03/gig"
  url "https://github.com/NeerajG03/gig/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "65b8d8a57a3ebb86f3d41fb6b1220dec7ec9e617b8392b733055fb0a523c2838"
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

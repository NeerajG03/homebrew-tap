class Gig < Formula
  desc "Lightweight task management CLI backed by SQLite"
  homepage "https://github.com/NeerajG03/gig"
  url "https://github.com/NeerajG03/gig/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "8ab6fec2ac3b24ee8310097d84d3bbe224506185f80143c542ec02dadb8edc39"
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

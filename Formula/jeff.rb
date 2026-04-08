class Jeff < Formula
  desc "Agent workspace manager built on gig"
  homepage "https://github.com/NeerajG03/JEFF"
  url "https://github.com/NeerajG03/JEFF/archive/refs/tags/v0.7.3-beta.tar.gz"
  sha256 "1748a0bda3dfb90c1d8763de9bd4f7763b3feef8e7f5226f842de1ca69c4b40d"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/jeff/"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jeff --version")
  end
end

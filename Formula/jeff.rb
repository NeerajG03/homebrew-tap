class Jeff < Formula
  desc "Agent workspace manager built on gig"
  homepage "https://github.com/NeerajG03/JEFF"
  url "https://github.com/NeerajG03/JEFF/archive/refs/tags/v0.3.2-beta.tar.gz"
  sha256 "ae925893a3ed9659c00fca403926db1249ec7aed60b04b0b47a2e382f4fa7266"
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

class Jeff < Formula
  desc "Agent workspace manager built on gig"
  homepage "https://github.com/NeerajG03/JEFF"
  url "https://github.com/NeerajG03/JEFF/archive/refs/tags/v0.7.6-beta.tar.gz"
  sha256 "e628faf6afddc3525492dad2545cfe054ae529e4228c6faeb35865c7818fd816"
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

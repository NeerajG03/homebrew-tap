class Jeff < Formula
  desc "Agent workspace manager built on gig"
  homepage "https://github.com/NeerajG03/JEFF"
  url "https://github.com/NeerajG03/JEFF/archive/refs/tags/v0.19.3-beta.tar.gz"
  sha256 "6e673c6294321f2903774665a061c0542b8e890f31ef7ff6934e82d66e2d457c"
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

class Jeff < Formula
  desc "Agent workspace manager built on gig"
  homepage "https://github.com/NeerajG03/JEFF"
  url "https://github.com/NeerajG03/JEFF/archive/refs/tags/v0.2.5-beta.tar.gz"
  sha256 "391f25df1126e10a221efdada4fa3ea191eb1cc3be84a5e3a2cf6f7558ab0484"
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

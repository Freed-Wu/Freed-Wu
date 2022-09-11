class %CFILE% < Formula
  desc "
    .!gh repo view --json description -q .description foo/%FILE%%HERE%
    "
  homepage "https://github.com/foo/%FILE%"
  url "https://github.com/foo/%FILE%/archive/v.tar.gz"
  sha256 ""
  license "%LICENSE%"
  head "https://github.com/foo/%FILE%.git", branch: "master"
  depends_on "cmake" => :build

  def install
    bin.install "%FILE%"
    man1.install "%FILE%.1"
  end

  test do
    assert_match "", shell_output("#{bin}/%FILE%")
  end
end

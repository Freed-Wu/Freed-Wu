class {{ substitute(expand('%:t:r'), '%(-|^)(.)', '\u', 'g') }} < Formula
  desc ""
  homepage "https://github.com/foo/{{ expand('%:t:r') }}"
  url "https://github.com/foo/{{ expand('%:t:r') }}/archive/v.tar.gz"
  sha256 ""
  license "GPLv3"
  head "https://github.com/foo/{{ expand('%:t:r') }}.git", branch: "master"
  depends_on "cmake" => :build

  def install
    bin.install "{{ expand('%:t:r') }}"
    man1.install "{{ expand('%:t:r') }}.1"
  end

  test do
    assert_match "", shell_output("#{bin}/{{ expand('%:t:r') }}")
  end
end

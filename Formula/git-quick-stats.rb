class GitQuickStats < Formula
  desc "Simple and efficient way to access statistics in git"
  homepage "https://github.com/arzzen/git-quick-stats"
  url "https://github.com/arzzen/git-quick-stats/archive/2.1.6.tar.gz"
  sha256 "47645d7eb261052f6818c73890b4bbc52d576cb877e2c91201f49f0d2b68115b"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "c7cf906fc38c2acfd290f3278e4c2641b6a3e000123e5900f8dba68c9b7060f7"
  end

  def install
    bin.install "git-quick-stats"
  end

  test do
    system "git", "init"
    assert_match "All branches (sorted by most recent commit)",
      shell_output("#{bin}/git-quick-stats --branches-by-date")
    assert_match(/^Invalid argument/, shell_output("#{bin}/git-quick-stats command", 1))
  end
end

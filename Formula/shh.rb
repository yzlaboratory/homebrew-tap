class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://github.com/yzlaboratory/shh/releases/download/v0.1.7/yzlaboratory-shh-0.1.7.tgz"
  sha256 "3e701f33d6c975210b9d6280ce7f2f4ddc07e42b9ad0c2dab06396cb7f71db56"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    (testpath/"comment.ts").write "// comment\nconst value = 1;\n"

    output = shell_output("#{bin}/shh check .", 1)
    assert_match "Found 1 comment", output
  end
end

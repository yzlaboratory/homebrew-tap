class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://registry.npmjs.org/@yzlaboratory/shh/-/shh-0.1.4.tgz"
  sha256 "e4a4d8fe19ffb9c25556a9f8b673096db35d7705c3cc2499a012100e7943cc14"
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

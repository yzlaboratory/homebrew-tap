class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://registry.npmjs.org/@yzlaboratory/shh/-/shh-0.1.3.tgz"
  sha256 "ad12383b950b0e049ec73fbd9919499d5124532e529644d640867acd0780b902"
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

class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://github.com/yzlaboratory/shh/releases/download/v0.1.6/yzlaboratory-shh-0.1.6.tgz"
  sha256 "a26f20c35d4fa64bcc24d2e9392703c0f6ac5b2475656d97fe91fb2665f8c525"
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

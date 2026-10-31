class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://github.com/yzlaboratory/shh/releases/download/v0.1.5/yzlaboratory-shh-0.1.5.tgz"
  sha256 "c670355769da508ec60df6908995bc12c51b1f4200347abd6d47d6cb4cc38f19"
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

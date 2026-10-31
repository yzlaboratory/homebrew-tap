class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://registry.npmjs.org/@yzlaboratory/shh/-/shh-0.1.2.tgz"
  sha256 "dfafae65a002833c82b745a5620fe2e19d6cb9e78234196caa6782ef011e7459"
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

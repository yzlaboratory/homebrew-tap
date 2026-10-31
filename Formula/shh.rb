class Shh < Formula
  desc "Radical no-comments linter for JavaScript and TypeScript"
  homepage "https://github.com/yzlaboratory/shh"
  url "https://github.com/yzlaboratory/shh/releases/download/v0.1.4/yzlaboratory-shh-0.1.4.tgz"
  sha256 "894d7910f473fdd5ed29a019ab35bdda8e035bf0b94a91dba557753fdd67f635"
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

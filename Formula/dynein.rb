class Dynein < Formula
  desc "DynamoDB CLI written in Rust"
  homepage "https://github.com/awslabs/dynein"
  url "https://github.com/awslabs/dynein/archive/v0.1.2.tar.gz"
  sha256 "701ed6d6a05fafa6bc54339bad6c84c8b85fc4c3d2d252f21415e047cbdc501c"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install_symlink "dy" => "dynein"
  end

  test do
    require "open3"
    assert_match "admin", shell_output("#{bin}/dynein --help")
    assert_match "admin", shell_output("#{bin}/dy --help")
    assert_match "Couldn't find AWS credentials", shell_output("#{bin}/dy ls &> /dev/stdout")
  end
end

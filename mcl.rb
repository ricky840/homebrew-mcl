class Mcl < Formula
  desc "To help looking up MoPub Adapter Change Logs"
  homepage "https://origin-sfo.datswatsup.com"
  url "https://raw.githubusercontent.com/ricky840/mChangeLog/main/mcl.rb"
  version "1.0.0"
  sha256 "04035fa198d65705935193ce7fb8ecec5488e077a4a90320fad6886bd57b3350"
  license "MIT"

  depends_on "ruby@2.7"

  resource "rainbow" do
    url "https://rubygems.org/downloads/rainbow-3.0.0.gem"
    sha256 "13ce4ffc3c94fb7a842117ecabdcdc5ff7fa27bec15ea44137b9f9abe575622d"
  end

  resource "word_wrap" do
    url "https://rubygems.org/downloads/word_wrap-1.0.0.gem"
    sha256 "f556d4224c812e371000f12a6ee8102e0daa724a314c3f246afaad76d82accc7"
  end

  resource "nokogiri" do
    url "https://rubygems.org/downloads/nokogiri-1.11.1-x86_64-darwin.gem"
    sha256 "5c26111f7f26831508cc5234e273afd93f43fbbfd0dcae5394490038b88d28e7"
  end

  resource "terminal-table" do
    url "https://rubygems.org/downloads/terminal-table-3.0.0.gem"
    sha256 "287a95f4853452ea464bc4193debf8ea44ff84bf127d9021455ca16e65538ab6"
  end

  resource "unicode-display_width" do
    url "https://rubygems.org/downloads/unicode-display_width-1.7.0.gem"
    sha256 "cad681071867a4cf52613412e379e39e85ac72b1d236677a2001187d448b231a"
  end

  def install
    ohai "Installing.."

    resources.each do |r|
      r.verify_download_integrity(r.fetch)
      system "gem", "install", r.cached_download, "--ignore-dependencies", "--no-document", "--install-dir", libexec
    end

    ENV["GEM_HOME"] = libexec
    bin.install "mcl.rb" => "mcl_s"
    (bin/"mcl").write_env_script Formula["ruby@2.7"].opt_bin/"ruby", "#{bin}/mcl_s", :GEM_HOME => ENV["GEM_HOME"]
  end

  test do
    system "#{bin}/mcl", "-h"
  end
end

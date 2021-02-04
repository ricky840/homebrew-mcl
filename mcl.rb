class Mcl < Formula
  desc "To help looking up MoPub Adapter Change Logs"
  homepage "https://origin-sfo.datswatsup.com"
  url "https://raw.githubusercontent.com/ricky840/mChangeLog/main/mcl.rb"
  version "1.0.0"
  sha256 "04035fa198d65705935193ce7fb8ecec5488e077a4a90320fad6886bd57b3350"
  license "MIT"

  resource "rainbow" do
    url "https://rubygems.org/downloads/rainbow-3.0.0.gem"
    sha256 "13ce4ffc3c94fb7a842117ecabdcdc5ff7fa27bec15ea44137b9f9abe575622d"
  end

  resource "word_wrap" do
    url "https://rubygems.org/downloads/word_wrap-1.0.0.gem"
    sha256 "f556d4224c812e371000f12a6ee8102e0daa724a314c3f246afaad76d82accc7"
  end

  resource "nokogiri" do
    url "https://rubygems.org/downloads/nokogiri-1.11.1.gem"
    sha256 "42c2a54dd3ef03ef2543177bee3b5308313214e99f0d1aa85f984324329e5caa"
  end

  resource "terminal-table" do
    url "https://rubygems.org/downloads/terminal-table-3.0.0.gem"
    sha256 "287a95f4853452ea464bc4193debf8ea44ff84bf127d9021455ca16e65538ab6"
  end

  def install
    ohai "Thanks for installing, please wait.."

    ENV["GEM_HOME"] = libexec

    resources.each do |r|
      r.fetch
      system "gem", "install", r.cached_download, "--ignore-dependencies", "--no-document", "--install-dir", libexec
    end

    bin.install libexec/"bin/mcl"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/mcl", "-h"
  end
end

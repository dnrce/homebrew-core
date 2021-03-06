class ZeldaRothSe < Formula
  desc "Zelda Return of the Hylian SE"
  homepage "http://www.solarus-games.org/games/zelda-return-of-the-hylian-se/"
  head "https://github.com/christopho/zelda_roth_se.git"

  stable do
    url "https://github.com/christopho/zelda_roth_se/archive/v1.1.0.tar.gz"
    sha256 "95baf3ce96372b1ce78d9af8ee9723840474ac8fc51e87eb54cc35777d68f5a8"

    # Support SOLARUS_INSTALL_DATADIR variable for CMake
    patch do
      url "https://github.com/christopho/zelda_roth_se/commit/e9b5bd907f5b50b17d65ebe2fa50760d322c537c.diff"
      sha256 "e8713c2b83e86821d4ca683c2653c36d0756d97a0fd8c3529a503d44c10e9306"
    end
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "2db05a8f1209a0f039c6bea92ffefb362d94497bc9f659e8057eca1539fc132e" => :sierra
    sha256 "7aa852ad416766a72aad6b254f86f21a53bd67df29f20b7eaa612ba709f8c0cd" => :el_capitan
    sha256 "069a42db0b88121a77233d3860a5191af80ad335270cc4723b1bb4ef1c48ccc3" => :yosemite
  end

  depends_on "cmake" => :build
  depends_on "solarus"

  def install
    system "cmake", ".", *std_cmake_args, "-DSOLARUS_INSTALL_DATADIR=#{share}"
    system "make", "install"
  end

  test do
    system Formula["solarus"].bin/"solarus-run", "-help"
    system "/usr/bin/unzip", share/"zelda_roth_se/data.solarus"
  end
end

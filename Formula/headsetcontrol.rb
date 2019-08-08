class Headsetcontrol < Formula
  desc "Sidetone support for various headsets"
  homepage "https://github.com/Sapd/HeadsetControl"
  url "https://github.com/Sapd/HeadsetControl/archive/2.2.tar.gz"
  sha256 "8614ae756430b9e70768b03d24091013811f4ea3bd23ce74bf3883620c2de46a"

  depends_on "cmake" => :build
  depends_on "hidapi"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = `#{bin}/HeadsetControl`

    # First string appears, when a headset is detected
    # Second when a headset was searched for, but none found
    assert_match(/(You didn't set|No supported headset found).*/, output)
  end
end

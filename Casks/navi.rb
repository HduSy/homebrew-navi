cask "navi" do
  version "0.3.2"
  sha256 "6ab7041362629cb15163ad5c04ee4cf189dd2cbe1d8216732fc18b5d04f6aaad"

  url "https://github.com/HduSy/navi/releases/download/v0.3.2/Navi_0.3.2_aarch64.dmg"
  name "Navi"
  desc "AI work companion that observes, remembers, and grows with you"
  homepage "https://github.com/HduSy/navi"

  depends_on macos: :catalina
  depends_on arch: :arm64

  app "Navi.app"

  # Unsigned/unnotarized build: strip the quarantine flag Homebrew
  # adds so the app opens without the "Apple cannot verify" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Navi.app"],
                   sudo: false
  end
end

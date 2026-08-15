cask "navi" do
  version "0.3.1"
  sha256 "3f1d0951267c0c925b6d2bb428d370b2183a05c7d9cf93bef2811002e1f04500"

  url "https://github.com/HduSy/navi/releases/download/v0.3.1/Navi_0.3.1_aarch64.dmg"
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

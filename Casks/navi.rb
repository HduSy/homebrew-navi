cask "navi" do
  version "0.3.4"
  sha256 "3fe68ba92d1507e7e86509ef1fa452091ecc967291effe14e0ebadc309386626"

  url "https://github.com/HduSy/navi/releases/download/v0.3.4/Navi_0.3.4_aarch64.dmg"
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

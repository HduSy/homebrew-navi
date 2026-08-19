cask "navi" do
  version "0.3.5"
  sha256 "230ce60219e9111a1c889012778afd7537eec59963e5aeddccdd0fc84f89c81e"

  url "https://github.com/HduSy/navi/releases/download/v0.3.5/Navi_0.3.5_aarch64.dmg"
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

cask "navi" do
  version "0.3.3"
  sha256 "8a7a2ba54e7d3fa176f7e34abbaa6e27e3ee7f1c4e2670b13ffd5b61337f4fc2"

  url "https://github.com/HduSy/navi/releases/download/v0.3.3/Navi_0.3.3_aarch64.dmg"
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
